class sequence2_req_ack extends uvm_sequence;

     `uvm_object_utils (sequence2_req_ack)

     function new(string name ="sequence2_req_ack");

            super.new(name);

     endfunction 
     
     virtual task body();
            int unsigned last_data = 1;
            int unsigned last_data1 = 0;
            item_req_ack item;
            item = item_req_ack::type_id::create("item");

            for(int i = 0; i<= 19; i++) begin
            start_item (item);
            if(!(item.randomize() with {data == last_data + last_data1;
                                        delay == i +1     ; 
                                        addr % 16 == 0   ; }))
               `uvm_error(get_type_name(), "Rand error")
            finish_item(item);
            
            last_data1  = last_data;
            last_data = item.data;
            end
     endtask : body

endclass : sequence2_req_ack