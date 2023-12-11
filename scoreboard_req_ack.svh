class scoreboard_req_ack extends uvm_scoreboard;


   `uvm_component_utils (scoreboard_req_ack)

   function new (string name = "scoreboard_req_ack", uvm_component parent = null);
        super.new(name, parent);

   endfunction 

   uvm_analysis_imp #(item_req_ack, scoreboard_req_ack) req_ack_imp;

   function void build_phase(uvm_phase phase);
            req_ack_imp = new("req_ack_imp", this);
   endfunction

   int unsigned Fib;
   int unsigned last_data = 1;
   int unsigned last_data1 = 0;
   virtual function void write(item_req_ack itm);
         //`uvm_info("write", $sformatf ("data receive = 0x%h", data), UVM_MEDIUM);
         Fib= last_data + last_data1;
         if(itm.data == Fib)
         `uvm_info("write", $sformatf ("data receive = %h", itm.data), UVM_MEDIUM)
        else 
        `uvm_error("write", $sformatf("nu merge"))
        last_data1 = last_data;
        last_data  = Fib;
         $display("%s" , itm.sprint());

        if(itm.addr [3:0] == 0)
          `uvm_info("write", $sformatf ("address receive = %h", itm.addr), UVM_MEDIUM)
        else  
          `uvm_error("write", $sformatf("nu merge"))
        
   endfunction


endclass : scoreboard_req_ack