/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP3
// Date      : Mon Aug 12 15:18:28 2024
/////////////////////////////////////////////////////////////


module DFF_dft_0 ( D, clk, scan_enable, scan_in, Q, Qbar, scan_out, test_so );
  input D, clk, scan_enable, scan_in;
  output Q, Qbar, scan_out, test_so;
  wire   d_internal, n4, n5;

  SAEDRVT14_FSDP_V2_0P5 Q_reg ( .D(d_internal), .SI(scan_in), .SE(scan_enable), 
        .CK(clk), .Q(Q), .QN(n4) );
  SAEDRVT14_FSDP_V2_0P5 Qbar_reg ( .D(n4), .SI(n4), .SE(scan_enable), .CK(clk), 
        .Q(Qbar) );
  SAEDRVT14_FSDP_V2_0P5 scan_out_reg ( .D(Q), .SI(Qbar), .SE(scan_enable), 
        .CK(clk), .Q(scan_out), .QN(test_so) );
  SAEDRVT14_AO22_1 U4 ( .A1(scan_in), .A2(scan_enable), .B1(D), .B2(n5), .X(
        d_internal) );
  SAEDRVT14_INV_1 U5 ( .A(scan_enable), .X(n5) );
endmodule


module DFF_dft_1 ( D, clk, scan_enable, scan_in, Q, Qbar, scan_out, test_si );
  input D, clk, scan_enable, scan_in, test_si;
  output Q, Qbar, scan_out;
  wire   d_internal, n1, n2, n5;

  SAEDRVT14_FSDP_V2_0P5 Q_reg ( .D(d_internal), .SI(test_si), .SE(scan_enable), 
        .CK(clk), .Q(Q), .QN(n2) );
  SAEDRVT14_FSDP_V2_0P5 Qbar_reg ( .D(n2), .SI(n2), .SE(scan_enable), .CK(clk), 
        .Q(Qbar), .QN(n5) );
  SAEDRVT14_FSDP_V2_0P5 scan_out_reg ( .D(Q), .SI(n5), .SE(scan_enable), .CK(
        clk), .Q(scan_out) );
  SAEDRVT14_AO22_1 U4 ( .A1(scan_in), .A2(scan_enable), .B1(D), .B2(n1), .X(
        d_internal) );
  SAEDRVT14_INV_1 U5 ( .A(scan_enable), .X(n1) );
endmodule


module DFF_ML_dft ( clk, D, scan_enable, scan_in, Q, Qbar, scan_out, test_si2, 
        test_so2 );
  input clk, D, scan_enable, scan_in, test_si2;
  output Q, Qbar, scan_out, test_so2;
  wire   q1, scan_out_master, n1, n3;

  SAEDRVT14_INV_1 U2 ( .A(clk), .X(n1) );
  SAEDRVT14_MUX2_MM_0P5 U3 ( .D0(test_so2), .D1(n3), .S(scan_enable), .X(
        scan_out) );
  DFF_dft_0 Master ( .D(D), .clk(n1), .scan_enable(scan_enable), .scan_in(
        scan_in), .Q(q1), .scan_out(scan_out_master), .test_so(n3) );
  DFF_dft_1 Slave ( .D(q1), .clk(clk), .scan_enable(scan_enable), .scan_in(
        scan_out_master), .Q(Q), .Qbar(Qbar), .scan_out(test_so2), .test_si(
        test_si2) );
endmodule

