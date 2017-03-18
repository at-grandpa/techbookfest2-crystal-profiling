@[Link("profiler")]
lib LibPROFILER
  fun cpu_start = ProfilerStart(filename : UInt8*)
  fun cpu_stop = ProfilerStop
end

@[Link("tcmalloc")]
lib LibTCMALLOC
  fun heap_start = HeapProfilerStart(filename : UInt8*)
  fun heap_dump = HeapProfilerDump
  fun heap_stop = HeapProfilerStop
end

module Profiler
  PROFILE_DIR            = "profile"
  CPU_PROFILE_DUMP_PATH  = "#{PROFILE_DIR}/cpu.prof"
  HEAP_PROFILE_DUMP_PATH = "#{PROFILE_DIR}/heap.prof"

  def self.start
    Dir.mkdir_p(PROFILE_DIR)
    LibPROFILER.cpu_start(CPU_PROFILE_DUMP_PATH)
    LibTCMALLOC.heap_start(HEAP_PROFILE_DUMP_PATH)
  end

  def self.stop
    LibPROFILER.cpu_stop
    LibTCMALLOC.heap_dump
    LibTCMALLOC.heap_stop
  end
end

class ExampleClass
  @instance_var1 : Array(Time)
  @instance_var2 : Array(Time)

  def initialize
    @instance_var1 = method1
    @instance_var2 = method2
  end

  def method1
    (1..1000000).map { |i| Time.new }
  end

  def method2
    (1..500000).map { |i| Time.new }
  end
end

Profiler.start
example_class = ExampleClass.new
Profiler.stop
