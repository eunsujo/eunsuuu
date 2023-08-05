module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [399:0] cout_tmp;
    genvar i;
    
    bcd_fadd u0(a[3:0], b[3:0], cin, cout_tmp[0], sum[3:0]);
    
    generate
        for(i=4; i<396; i=i+4)begin : bcd_fadd_block
            bcd_fadd u1(a[i+3:i], b[i+3:i], cout_tmp[i-4], cout_tmp[i], sum[i+3:i]);
        end
    endgenerate
    
    bcd_fadd u100(a[399:396], b[399:396], cout_tmp[392], cout, sum[399:396]);
    
endmodule
