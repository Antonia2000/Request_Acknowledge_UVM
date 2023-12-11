class monitor_req_ack extends uvm_monitor;

     `uvm_component_utils (monitor_req_ack)

     function new (string name = "monitor_req_ack", uvm_component parent);
           super.new (name, parent);
     endfunction

     virtual if_req_ack vif;

     uvm_analysis_port #(item_req_ack) mon_analysis_port;

     virtual function void build_phase(uvm_phase phase);
          super.build_phase (phase);
          
          mon_analysis_port = new ("mon_analysis_port", this);

          if(! uvm_config_db #(virtual if_req_ack) :: get (this, "", "vif", vif)) begin
             `uvm_error (get_type_name (), "DUT interface not found") 

          end

     endfunction


     virtual task run_phase (uvm_phase phase);
        item_req_ack item = item_req_ack::type_id::create("item", this);
        forever begin
            @(posedge vif.cb_monitor.req)
            @(posedge vif.cb_monitor.ack);
            item.data = vif.cb_monitor.data;
            item.addr = vif.cb_monitor.addr;
            $display("%s" , item.sprint());
            mon_analysis_port.write(item);
        end
     endtask

endclass : monitor_req_ack