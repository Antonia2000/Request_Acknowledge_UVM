class req_ack_test extends uvm_test;

     `uvm_component_utils(req_ack_test)

    function new(string name = "req_ack_test", uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    environment_req_ack env0;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env0 = environment_req_ack::type_id::create("env0", this);
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
           uvm_top.print_topology();
    endfunction

    virtual task run_phase(uvm_phase phase);
    sequence_req_ack sequence_req_ack = sequence_req_ack::type_id::create("item");
    phase.raise_objection (this);
    //#10;
    `uvm_info (get_type_name(), $sformatf ("Hello world"), UVM_NONE)
    sequence_req_ack.start(env0.agnt.seq);

    phase.drop_objection (this);
    endtask

endclass