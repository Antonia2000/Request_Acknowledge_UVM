class environment_req_ack extends uvm_env;

     `uvm_component_utils (environment_req_ack)

     function new (string name = "environment_req_ack", uvm_component parent = null);
              
              super.new(name, parent);

     endfunction

     agent_req_ack agnt;
     agent_req_ack agnt_slave;
     scoreboard_req_ack scor_req_ack;

     virtual function void build_phase(uvm_phase phase);
            
            super.build_phase(phase);

            agnt = agent_req_ack::type_id::create("agnt", this);
            agnt_slave = agent_req_ack::type_id::create("agnt_slave", this);
            scor_req_ack = scoreboard_req_ack::type_id::create("scor_req_ack", this);
            agnt.is_master = 1;
            agnt_slave.is_master = 0;

     endfunction

     virtual function void connect_phase (uvm_phase phase);
            super.connect_phase (phase);
            agnt.mon.mon_analysis_port.connect(scor_req_ack.req_ack_imp);

     endfunction


endclass :  environment_req_ack