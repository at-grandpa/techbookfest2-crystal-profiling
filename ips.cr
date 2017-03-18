require "benchmark"

Benchmark.ips do |x|
  x.report("short") { sleep 0.01 }
  x.report("shorter") { sleep 0.001 }
end
