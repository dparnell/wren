import "scheduler" for Scheduler

class Timer {
  static def sleep(milliseconds) {
    if (!(milliseconds is Num)) Fiber.abort("Milliseconds must be a number.")
    if (milliseconds < 0) Fiber.abort("Milliseconds cannot be negative.")

    startTimer_(milliseconds, Fiber.current)
    Scheduler.runNextScheduled_()
  }

  foreign static def startTimer_(milliseconds, fiber)
}
