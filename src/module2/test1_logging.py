import logging

logging.basicConfig(
    level=logging.INFO,
    filename="app.log",
    filemode="a",
    format="%(levelname)s - %(message)s",
    datefmt="%H:%M:%S"
)

logging.info("Program started")
logging.warning("Low memory")
logging.error("File not found")

print("Logging completed")