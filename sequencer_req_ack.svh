class sequencer_req_ack extends uvm_sequencer #(item_req_ack);

       `uvm_component_utils (sequencer_req_ack)
        function new (string name="sequencer_req_ack", uvm_component parent);
            super.new(name, parent);
        endfunction 

endclass : sequencer_req_ack