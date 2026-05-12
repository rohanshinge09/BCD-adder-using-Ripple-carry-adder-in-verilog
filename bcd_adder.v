module bcd_adder(
    input  [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] sum_temp;
    wire cout_temp;
    wire a_1,a_2,o_1;
    wire [3:0] b_rca_2;
    rca_4bit (a_bcd,b_bcd,cin,sum_temp,cout_temp);
    and a1(a_1,sum_temp[3],sum_temp[2]);
    and a2(a_2,sum_temp[3],sum_temp[1]);
    or o1(o_1,a_1,a_2);
    assign b_rca_2[0] = 0;
    assign b_rca_2[3] = 0;
    assign b_rca_2[1] = 0_1;
    assign b_rca_2[2] = 0_1;
    rca_4bit(sum_temp,b_rca,sum,cout);
  
endmodule
