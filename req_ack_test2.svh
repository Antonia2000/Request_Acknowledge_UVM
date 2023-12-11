class req_ack_test2 extends uvm_test;

     `uvm_component_utils(req_ack_test2)

    function new(string name = "req_ack_test2", uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    environment_req_ack env0;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env0 = environment_req_ack::type_id::create("env0", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
    sequence2_req_ack sequence2_req_ack = sequence2_req_ack::type_id::create("item");
    sequence_slv sequence_slv = sequence_slv::type_id::create("item1");
    phase.raise_objection (this);
    //#10;
    // `uvm_info (get_type_name(), $sformatf ("Hello world"), UVM_NONE)
    fork
        sequence2_req_ack.start(env0.agnt.seq);
        sequence_slv.start(env0.agnt_slave.seq);
    join_any
    phase.drop_objection (this);
    endtask

endclass : req_ack_test2