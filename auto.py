"""
File struct:

 - verilog_proj_dir
 | - auto.py
 | - module
   | - module.v
   | - module_tb.v
 | - module2
   | - module2.v
   | - module2_tb.v
  ...
"""

import sys, os, time, signal
module_name = None

pid = os.fork


try:
    module_name = sys.argv[1]
except:
    raise KeyError("Please add a module name with an existing test bench after `python3 auto.py` like `python3 auto.py module_name`")

command1 = f"cd {module_name}"
command2 = f"iverilog -g2012 -o {module_name} {module_name}_tb.v  {module_name}.v "
command3 = f"vvp {module_name}"
command4 = f"gtkwave {module_name}.vds"
# command5 = "finish"
os.system(f"{command1} && {command2}  && {command3} && {command4}")
# time.sleep(100)
# os.kill(pid, signal.SIGINT)
# os.system(f"finish")