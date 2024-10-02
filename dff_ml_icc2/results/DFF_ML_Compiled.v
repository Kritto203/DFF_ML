// IC Compiler II Version U-2022.12-SP3 Verilog Writer
// Generated on 8/16/2024 at 14:22:39
// Library Name: DFF_ML
// Block Name: DFF_ML
// User Label: 
// Write Command: write_verilog -include { all } ../results/DFF_ML_Compiled.v
module DFF_1 ( D , clk , Q , Qbar , VSS , VDD ) ;
input  D ;
input  clk ;
output Q ;
output Qbar ;
input  VSS ;
input  VDD ;

wire n2 ;
supply0 VSS ;
supply1 VDD ;
wire SYNOPSYS_UNCONNECTED_1 ;
wire SYNOPSYS_UNCONNECTED_2 ;

SAEDRVT14_FDP_V2LP_1 Qbar_reg ( .D ( n2 ) , .CK ( clk ) , .Q ( Qbar ) , 
    .QN ( SYNOPSYS_UNCONNECTED_1 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
SAEDRVT14_FDP_V2LP_1 Q_reg ( .D ( D ) , .CK ( clk ) , .Q ( Q ) , 
    .QN ( SYNOPSYS_UNCONNECTED_2 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
SAEDRVT14_INV_1 U3 ( .A ( D ) , .X ( n2 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
endmodule


module DFF_0 ( D , clk , Q , Qbar , VSS , VDD ) ;
input  D ;
input  clk ;
output Q ;
output Qbar ;
input  VSS ;
input  VDD ;

wire Qbar_gOb0 ;
wire n1 ;
supply0 VSS ;
supply1 VDD ;
wire SYNOPSYS_UNCONNECTED_1 ;
wire SYNOPSYS_UNCONNECTED_2 ;

SAEDRVT14_FDP_V2LP_1 Qbar_reg ( .D ( n1 ) , .CK ( clk ) , .Q ( Qbar_gOb0 ) , 
    .QN ( SYNOPSYS_UNCONNECTED_1 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
SAEDRVT14_FDP_V2LP_1 Q_reg ( .D ( D ) , .CK ( clk ) , .Q ( Q ) , 
    .QN ( SYNOPSYS_UNCONNECTED_2 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
SAEDRVT14_INV_S_0P5 U3 ( .A ( D ) , .X ( n1 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
endmodule


module DFF_ML ( clk , D , Q , Qbar , VDD , VSS ) ;
input  clk ;
input  D ;
output Q ;
output Qbar ;
input  VDD ;
input  VSS ;

wire q1 ;
wire n1 ;
supply0 VSS ;
supply1 VDD ;
wire SYNOPSYS_UNCONNECTED_1 ;

DFF_0 Master ( .D ( D ) , .clk ( n1 ) , .Q ( q1 ) , 
    .Qbar ( SYNOPSYS_UNCONNECTED_1 ) , .VSS ( VSS ) , .VDD ( VDD ) ) ;
DFF_1 slave ( .D ( q1 ) , .clk ( clk ) , .Q ( Q ) , .Qbar ( Qbar ) , 
    .VSS ( VSS ) , .VDD ( VDD ) ) ;
SAEDRVT14_INV_1 U2 ( .A ( clk ) , .X ( n1 ) , .VDD ( VDD ) , .VSS ( VSS ) ) ;
SAEDRVT14_FILL2 \xofiller!SAEDRVT14_FILL2!x0y0 () ;
SAEDRVT14_FILL2 \xofiller!SAEDRVT14_FILL2!x2960y0 () ;
SAEDRVT14_FILL2 \xofiller!SAEDRVT14_FILL2!x5920y0 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x15540y6000 () ;
SAEDRVT14_FILL2 \xofiller!SAEDRVT14_FILL2!x19240y6000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x22200y6000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x22940y6000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x23680y6000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x0y12000 () ;
SAEDRVT14_FILL2 \xofiller!SAEDRVT14_FILL2!x19240y12000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x22200y12000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x22940y12000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x23680y12000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x0y18000 () ;
SAEDRVT14_FILL2 \xofiller!SAEDRVT14_FILL2!x3700y18000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x22200y18000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x22940y18000 () ;
SAEDRVT14_FILL_ECO_1 \xofiller!SAEDRVT14_FILL_ECO_1!x23680y18000 () ;
endmodule


