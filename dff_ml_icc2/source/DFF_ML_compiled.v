/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP3
// Date      : Mon Aug 12 15:17:08 2024
/////////////////////////////////////////////////////////////


module DFF_0 ( D, clk, Q, Qbar );
  input D, clk;
  output Q, Qbar;
  wire   n1;

  SAEDRVT14_FDP_V2LP_0P5 Qbar_reg ( .D(n1), .CK(clk), .Q(Qbar) );
  SAEDRVT14_FDP_V2LP_0P5 Q_reg ( .D(D), .CK(clk), .Q(Q) );
  SAEDRVT14_INV_1 U3 ( .A(D), .X(n1) );
endmodule


module DFF_1 ( D, clk, Q, Qbar );
  input D, clk;
  output Q, Qbar;
  wire   n2;

  SAEDRVT14_FDP_V2LP_0P5 Qbar_reg ( .D(n2), .CK(clk), .Q(Qbar) );
  SAEDRVT14_FDP_V2LP_0P5 Q_reg ( .D(D), .CK(clk), .Q(Q) );
  SAEDRVT14_INV_1 U3 ( .A(D), .X(n2) );
endmodule


module DFF_ML ( clk, D, Q, Qbar );
  input clk, D;
  output Q, Qbar;
  wire   q1, n1;

  DFF_0 Master ( .D(D), .clk(n1), .Q(q1) );
  DFF_1 slave ( .D(q1), .clk(clk), .Q(Q), .Qbar(Qbar) );
  SAEDRVT14_INV_1 U2 ( .A(clk), .X(n1) );
endmodule

