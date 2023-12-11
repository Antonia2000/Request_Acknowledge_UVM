
interface if_req_ack(
    
    input clk,
    input rst_n
);

 import uvm_pkg::*;

wire        req;
wire        ack;
wire [31:0] data;
wire [31:0] addr;

 clocking cb_drv @ (posedge clk);
      output req;
      output data;
      output addr;
      input  ack;
 endclocking : cb_drv

 clocking cb_slv @ (posedge clk);
      input req;
      input data;
      input addr;
      output ack;
 endclocking : cb_slv


 clocking cb_monitor @ (posedge clk);
      input req;
      input data;
      input addr;
      input  ack;
 endclocking : cb_monitor

endinterface