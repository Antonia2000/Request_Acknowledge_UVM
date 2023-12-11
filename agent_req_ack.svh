class APB_agent extends uvm_agent;
     `uvm_component_utils (APB_agent)

     function new (string name = "APB_agent", uvm_component parent = null);
           super.new(name, parent);
     endfunction 

     driver_req_ack     drv;
     monitor_req_ack    mon;
     sequencer_req_ack  seq;

     virtual function void build_phase(uvm_phase phase);
                 
                 if(get_is_active()) begin
                        seq = sequencer_req_ack::type_id::create("seq", this);
                        if(is_master)
                              drv = driver_req_ack::type_id::create("drv", this);
                        else 
                              drv_slv = driver_slv::type_id::create("drv_slv", this);
                 end

                 mon = monitor_req_ack::type_id:: create("mon", this);

     endfunction

     virtual function void connect_phase (uvm_phase phase);
            
            if(get_is_active())
              if(is_master)
                  drv.seq_item_port.connect(seq.seq_item_export);
              else
                  drv_slv.seq_item_port.connect(seq.seq_item_export);

     endfunction
endclass : APB_agent