
class sequence_req_ack extends uvm_sequence;

     `uvm_object_utils (sequence_req_ack)

     function new(string name ="sequence_req_ack");

            super.new(name);

     endfunction 
     
     virtual task body();
            
            item_req_ack item;
            item = item_req_ack::type_id::create("item");

            for(int i = 0; i<=9; i++) begin
            start_item (item);
            if(!(item.randomize() with {data == i;}))
               `uvm_error(get_type_name(), "Rand error")
            finish_item(item);
            end
     endtask : body

endclass : sequence_req_ack
     