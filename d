= ..eexxiitt

(from ruby core)
=== IImmpplleemmeennttaattiioonn  ffrroomm  CCoonntteexxtt
------------------------------------------------------------------------------
  exit(ret = 0)

------------------------------------------------------------------------------

Exits the current session, see IRB.irb_exit


(from ruby core)
=== IImmpplleemmeennttaattiioonn  ffrroomm  KKeerrnneell
------------------------------------------------------------------------------
  exit(status=true)
  Kernel::exit(status=true)
  Process::exit(status=true)

------------------------------------------------------------------------------

Initiates the termination of the Ruby script by raising the SystemExit
exception. This exception may be caught. The optional parameter is used to
return a status code to the invoking environment. true and FALSE of
_s_t_a_t_u_s means success and failure respectively.  The interpretation
of other integer values are system dependent.

  begin
    exit
    puts "never get here"
  rescue SystemExit
    puts "rescued a SystemExit exception"
  end
  puts "after begin block"

_p_r_o_d_u_c_e_s_:

  rescued a SystemExit exception
  after begin block

Just prior to termination, Ruby executes any at_exit functions (see
Kernel::at_exit) and runs any object finalizers (see
ObjectSpace::define_finalizer).

  at_exit { puts "at_exit function" }
  ObjectSpace.define_finalizer("string",  proc { puts "in finalizer" })
  exit

_p_r_o_d_u_c_e_s_:

  at_exit function
  in finalizer


(from ruby core)
=== IImmpplleemmeennttaattiioonn  ffrroomm  PPrroocceessss
------------------------------------------------------------------------------
  exit(status=true)
  Kernel::exit(status=true)
  Process::exit(status=true)

------------------------------------------------------------------------------

Initiates the termination of the Ruby script by raising the SystemExit
exception. This exception may be caught. The optional parameter is used to
return a status code to the invoking environment. true and FALSE of
_s_t_a_t_u_s means success and failure respectively.  The interpretation
of other integer values are system dependent.

  begin
    exit
    puts "never get here"
  rescue SystemExit
    puts "rescued a SystemExit exception"
  end
  puts "after begin block"

_p_r_o_d_u_c_e_s_:

  rescued a SystemExit exception
  after begin block

Just prior to termination, Ruby executes any at_exit functions (see
Kernel::at_exit) and runs any object finalizers (see
ObjectSpace::define_finalizer).

  at_exit { puts "at_exit function" }
  ObjectSpace.define_finalizer("string",  proc { puts "in finalizer" })
  exit

_p_r_o_d_u_c_e_s_:

  at_exit function
  in finalizer


(from ruby core)
=== IImmpplleemmeennttaattiioonn  ffrroomm  TThhrreeaadd
------------------------------------------------------------------------------
  Thread.exit   -> thread

------------------------------------------------------------------------------

Terminates the currently running thread and schedules another thread to be
run.

If this thread is already marked to be killed, ::exit returns the Thread.

If this is the main thread, or the last  thread, exit the process.


(from ruby core)
=== IImmpplleemmeennttaattiioonn  ffrroomm  TThhrreeaadd
------------------------------------------------------------------------------
  thr.exit        -> thr or nil
  thr.kill        -> thr or nil
  thr.terminate   -> thr or nil

------------------------------------------------------------------------------

Terminates thr and schedules another thread to be run.

If this thread is already marked to be killed, #exit returns the Thread.

If this is the main thread, or the last thread, exits the process.


