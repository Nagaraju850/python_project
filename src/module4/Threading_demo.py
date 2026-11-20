import threading
import time


def task(task_name: str) -> None:
    print(f"{task_name} started")
    time.sleep(3)
    print(f"{task_name} completed")


def main() -> None:
    threads = [
        threading.Thread(target=task, args=("Task 1",)),
        threading.Thread(target=task, args=("Task 2",)),
    ]

    start_time = time.perf_counter()

    for thread in threads:
        thread.start()

    for thread in threads:
        thread.join()

    elapsed_time = time.perf_counter() - start_time
    print(f"Total execution time: {elapsed_time:.2f} seconds")


if __name__ == "__main__":
    main()