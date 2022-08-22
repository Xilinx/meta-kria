DESCRIPTION = "Generate a QSPI image for the Kria SOM platform"
SUMMARY = "QSPI image includes image selectors, various registers, A/B images and recovery images"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS = "virtual/imgsel virtual/imgrcry virtual/boot-bin virtual/fsbl"

inherit deploy image-artifact-names

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:k26 = "${MACHINE}"

QSPI_VERSION = "2.0"
QSPI_IMAGE_NAME = "XilinxSom_QspiImage"

python do_compile () {
    import io
    import hashlib
    import time

    QSPI_SIZE = 0x2280000

    # Register values
    IDN_REG = 0x4D554241 # ABUM - A/B Update Mechanism
    VERSION_REG = 0x1
    LENGTH_REG = 0x4
    PERSISTENT_REG = 0x01010000
    
    # QSPI Offsets
    IMAGE_SELECTOR_OFFSET = 0x0
    IMAGE_SELECTOR_BACKUP_OFFSET = 0x80000
    PERSISTENT_REG_OFFSET = 0x100000
    PERSISTENT_REG_BACKUP_OFFSET = 0x120000
    IMAGE_A_OFFSET = 0x200000
    IMAGE_A_IMGSEL_OFFSET = 0xF00000
    IMAGE_B_OFFSET = 0xF80000
    IMAGE_B_IMGSEL_OFFSET = 0x1C80000
    IMAGE_RCVRY_OFFSET = 0x1E00000
    IMAGE_RCVRY_BACKUP_OFFSET = 0x2000000
    VERSION_OFFSET = 0x2240000
    CHECKSUM_OFFSET = 0x2250000

    # QSPI data
    qspi_data = io.BytesIO()
    qspi_data.write(b'\xFF' * QSPI_SIZE)

    # Image Selector - Primary, Backup, Image A and Image B
    imgsel_file = d.getVar("DEPLOY_DIR_IMAGE")+"/imgsel-"+d.getVar("MACHINE")+".bin"
    try:
        with open(imgsel_file, "rb") as il:
            imgsel = il.read(-1)
    except OSError as err:
        bb.fatal("Unable to open imgsel file: " + str(err))

    qspi_data.seek(IMAGE_SELECTOR_OFFSET)
    qspi_data.write(imgsel)
    qspi_data.seek(IMAGE_SELECTOR_BACKUP_OFFSET)
    qspi_data.write(imgsel)
    qspi_data.seek(IMAGE_A_IMGSEL_OFFSET)
    qspi_data.write(imgsel)
    qspi_data.seek(IMAGE_B_IMGSEL_OFFSET)
    qspi_data.write(imgsel)

    # Persistent Registers - Primary and Backup
    P_REG = [IDN_REG, VERSION_REG, LENGTH_REG, PERSISTENT_REG, IMAGE_A_OFFSET, IMAGE_B_OFFSET, IMAGE_RCVRY_OFFSET]
    CHECKSUM = 0xFFFFFFFF - (0xFFFFFFFF & sum(P_REG))
    P_REG.insert(3, CHECKSUM)

    qspi_data.seek(PERSISTENT_REG_OFFSET)
    for value in P_REG:
        qspi_data.write(value.to_bytes(4, byteorder="little"))

    qspi_data.seek(PERSISTENT_REG_BACKUP_OFFSET)
    for value in P_REG:
        qspi_data.write(value.to_bytes(4, byteorder="little"))

    # Image A and B - boot.bin
    try:
        with open(d.getVar("DEPLOY_DIR_IMAGE")+"/boot.bin", "rb") as bo:
            bootbin = bo.read(-1)
    except OSError as err:
        bb.fatal("Unable to open boot.bin file: " + str(err))

    qspi_data.seek(IMAGE_A_OFFSET)
    qspi_data.write(bootbin)
    qspi_data.seek(IMAGE_B_OFFSET)
    qspi_data.write(bootbin)

    # Recovery Image & Recovery Image Backup
    imgrcry_file = d.getVar("DEPLOY_DIR_IMAGE")+"/imgrcry-"+d.getVar("MACHINE")+".bin"
    try:
        with open(imgrcry_file, "rb") as iy:
            imgrcry = iy.read(-1)
    except OSError as err:
        bb.fatal("Unable to open imgrcry file: " + str(err))

    qspi_data.seek(IMAGE_RCVRY_OFFSET)
    qspi_data.write(imgrcry)
    qspi_data.seek(IMAGE_RCVRY_BACKUP_OFFSET)
    qspi_data.write(imgrcry)

    # Version string and checksum
    version = d.getVar("QSPI_VERSION")
    date = time.strftime("%m%d%H%M")
    image_name = d.getVar("QSPI_IMAGE_NAME")

    qspi_version = f"{image_name}-v{version}-{date}\x00"
    qspi_data.seek(VERSION_OFFSET)
    qspi_data.write(qspi_version.encode())

    qspi_sha = hashlib.sha256(qspi_data.getbuffer())
    qspi_data.seek(CHECKSUM_OFFSET)
    qspi_data.write(qspi_sha.digest())

    # Write the QSPI data to file 
    with open(d.getVar("B") + "/" + d.getVar("IMAGE_NAME") + ".bin", "wb") as sq:
        sq.write(qspi_data.getbuffer())
}

do_deploy () {
    install -Dm 644 ${B}/${IMAGE_NAME}.bin ${DEPLOYDIR}/${IMAGE_NAME}.bin
    ln -s ${IMAGE_NAME}.bin ${DEPLOYDIR}/${IMAGE_LINK_NAME}.bin
}

addtask deploy after do_compile
