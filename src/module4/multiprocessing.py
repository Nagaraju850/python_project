import multiprocessing
import time

def task(name):
    print(f"{name} started")
    time.sleep(2)
    print(f"{name} completed")

if __name__ == "__main__":

    start = time.perf_counter()

    p1 = multiprocessing.Process(target=task, args=("Process 1",))
    p2 = multiprocessing.Process(target=task, args=("Process 2",))

    p1.start()
    p2.start()

    p1.join()
    p2.join()

    end = time.perf_counter()

    print(f"Total execution time: {end - start:.2f} seconds")