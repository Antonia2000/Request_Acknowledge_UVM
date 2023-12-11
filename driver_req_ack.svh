class driver_req_ack extends uvm_driver #(item_req_ack);

      `uvm_component_utils (driver_req_ack)

      function new (string name = "driver_req_ack", uvm_component parent);
             super.new (name, parent);
      endfunction

      virtual if_req_ack vif;

      function void build_phase(uvm_phase phase);
          super.build_phase(phase);
          `uvm_info (get_type_name(), $sformatf ("driver "), UVM_NONE)
          if(!uvm_config_db #(virtual  if_req_ack) :: get ( this, "", "vif", vif)) begin
              `uvm_fatal (get_type_name (), "Didn't get handle to virtual interface")
          end
      endfunction

      task run_phase(uvm_phase phase);
        @(posedge vif.rst_n);
        forever begin
             seq_item_port.get_next_item(req);
             $display("%s" , req.sprint());
             vif.cb_drv.req <= 1;
             vif.cb_drv.data <= req.data;
             vif.cb_drv.addr <= req.addr;
             @(vif.cb_drv.ack);
             vif.cb_drv.req <= 0;
             repeat(req.delay) @(vif.cb_drv);
             seq_item_port.item_done();
             
        end

      endtask : run_phase
endclass : driver_req_ack