class req_ack_test1 extends uvm_test;

     `uvm_component_utils(req_ack_test1)

    function new(string name = "req_ack_test1", uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    environment_req_ack env0;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env0 = environment_req_ack::type_id::create("env0", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
    sequence1_req_ack sequence1_req_ack = sequence1_req_ack::type_id::create("item");
    phase.raise_objection (this);
    //#10;
    // `uvm_info (get_type_name(), $sformatf ("Hello world"), UVM_NONE)
    sequence1_req_ack.start(env0.agnt.seq);

    phase.drop_objection (this);
    endtask

endclass : req_ack_test1