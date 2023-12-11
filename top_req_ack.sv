
module top_req_ack();

  import uvm_pkg::*;
  import req_ack_pkg::*;

  bit clk;
  bit rst_n;

 if_req_ack vif ( .clk(clk),
                  .rst_n(rst_n));

 if_req_ack vif1 ( .clk(clk),
                  .rst_n(rst_n));

initial begin
    uvm_config_db#(virtual if_req_ack)::set(uvm_root::get(),"*.agnt.*","vif",vif);
    uvm_config_db#(virtual if_req_ack)::set(uvm_root::get(),"*.agnt_slave.*","vif",vif1);
    // run_test("req_ack_test");
    //run_test("req_ack_test1");
    run_test("req_ack_test2");
end

initial begin
    forever begin
    #5 clk = ~clk;  
    end
end

initial 
begin
    rst_n = 1;
    #2;
    rst_n = 0;
    #2;
    rst_n = 1;
end 




assign vif1.req = vif.req;
assign vif1.data = vif.data;
assign vif1.addr = vif.addr;

assign vif.ack = vif1.ack;
 

endmodule