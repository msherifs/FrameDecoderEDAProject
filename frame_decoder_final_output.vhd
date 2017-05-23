library sxlib_ModelSim;
entity frame_decoder_final_output is
   port (
      vdd      : in      bit;
      vss      : in      bit;
      clk      : in      bit;
      reset    : in      bit;
      err      : out     bit;
      word_in  : in      bit_vector(7 downto 0);
      address  : out     bit_vector(7 downto 0);
      data     : out     bit_vector(7 downto 0);
      scanin   : in      bit;
      scantest : in      bit;
      scanout  : out     bit
 );
end frame_decoder_final_output;

architecture structural of frame_decoder_final_output is
Component a2_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component nao22_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component no4_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component a3_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component inv_x2
   port (
      i   : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component nao2o22_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component oa22_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component o2_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component no2_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component an12_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component na2_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component no3_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component na4_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      i3  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component na3_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component o3_x2
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component on12_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component noa22_x1
   port (
      i0  : in      bit;
      i1  : in      bit;
      i2  : in      bit;
      nq  : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component sff2_x4
   port (
      ck  : in      bit;
      cmd : in      bit;
      i0  : in      bit;
      i1  : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

Component buf_x2
   port (
      i   : in      bit;
      q   : out     bit;
      vdd : in      bit;
      vss : in      bit
 );
end component;

signal frame_decoder_cs     : bit_vector( 3 downto 0);
signal not_frame_decoder_cs : bit_vector( 3 downto 0);
signal not_word_in          : bit_vector( 7 downto 1);
signal on12_x1_sig          : bit;
signal oa22_x2_sig          : bit;
signal o3_x2_sig            : bit;
signal o3_x2_2_sig          : bit;
signal o2_x2_sig            : bit;
signal o2_x2_2_sig          : bit;
signal not_reset            : bit;
signal not_aux8             : bit;
signal not_aux5             : bit;
signal not_aux4             : bit;
signal not_aux3             : bit;
signal noa22_x1_sig         : bit;
signal noa22_x1_2_sig       : bit;
signal no4_x1_sig           : bit;
signal no4_x1_4_sig         : bit;
signal no4_x1_3_sig         : bit;
signal no4_x1_2_sig         : bit;
signal no3_x1_sig           : bit;
signal no3_x1_2_sig         : bit;
signal no2_x1_sig           : bit;
signal no2_x1_2_sig         : bit;
signal nao2o22_x1_sig       : bit;
signal na4_x1_sig           : bit;
signal na4_x1_4_sig         : bit;
signal na4_x1_3_sig         : bit;
signal na4_x1_2_sig         : bit;
signal na3_x1_sig           : bit;
signal na3_x1_6_sig         : bit;
signal na3_x1_5_sig         : bit;
signal na3_x1_4_sig         : bit;
signal na3_x1_3_sig         : bit;
signal na3_x1_2_sig         : bit;
signal na2_x1_sig           : bit;
signal na2_x1_9_sig         : bit;
signal na2_x1_8_sig         : bit;
signal na2_x1_7_sig         : bit;
signal na2_x1_6_sig         : bit;
signal na2_x1_5_sig         : bit;
signal na2_x1_4_sig         : bit;
signal na2_x1_3_sig         : bit;
signal na2_x1_2_sig         : bit;
signal na2_x1_11_sig        : bit;
signal na2_x1_10_sig        : bit;
signal inv_x2_sig           : bit;
signal aux6                 : bit;
signal a3_x2_sig            : bit;
signal a2_x2_sig            : bit;

begin

a2_x2_ins : a2_x2
   port map (
      i0  => frame_decoder_cs(2),
      i1  => not_frame_decoder_cs(0),
      q   => a2_x2_sig,
      vdd => vdd,
      vss => vss
   );

not_aux8_ins : nao22_x1
   port map (
      i0  => frame_decoder_cs(1),
      i1  => a2_x2_sig,
      i2  => frame_decoder_cs(3),
      nq  => not_aux8,
      vdd => vdd,
      vss => vss
   );

not_aux5_ins : o2_x2
   port map (
      i0  => frame_decoder_cs(3),
      i1  => not_aux4,
      q   => not_aux5,
      vdd => vdd,
      vss => vss
   );

not_aux3_ins : na3_x1
   port map (
      i0  => frame_decoder_cs(2),
      i1  => frame_decoder_cs(3),
      i2  => not_frame_decoder_cs(0),
      nq  => not_aux3,
      vdd => vdd,
      vss => vss
   );

not_frame_decoder_cs_2_ins : inv_x2
   port map (
      i   => frame_decoder_cs(2),
      nq  => not_frame_decoder_cs(2),
      vdd => vdd,
      vss => vss
   );

not_frame_decoder_cs_0_ins : inv_x2
   port map (
      i   => frame_decoder_cs(0),
      nq  => not_frame_decoder_cs(0),
      vdd => vdd,
      vss => vss
   );

not_aux4_ins : na2_x1
   port map (
      i0  => not_reset,
      i1  => frame_decoder_cs(1),
      nq  => not_aux4,
      vdd => vdd,
      vss => vss
   );

not_frame_decoder_cs_1_ins : inv_x2
   port map (
      i   => frame_decoder_cs(1),
      nq  => not_frame_decoder_cs(1),
      vdd => vdd,
      vss => vss
   );

not_frame_decoder_cs_3_ins : inv_x2
   port map (
      i   => frame_decoder_cs(3),
      nq  => not_frame_decoder_cs(3),
      vdd => vdd,
      vss => vss
   );

not_reset_ins : inv_x2
   port map (
      i   => reset,
      nq  => not_reset,
      vdd => vdd,
      vss => vss
   );

not_word_in_7_ins : inv_x2
   port map (
      i   => word_in(7),
      nq  => not_word_in(7),
      vdd => vdd,
      vss => vss
   );

not_word_in_6_ins : inv_x2
   port map (
      i   => word_in(6),
      nq  => not_word_in(6),
      vdd => vdd,
      vss => vss
   );

not_word_in_5_ins : inv_x2
   port map (
      i   => word_in(5),
      nq  => not_word_in(5),
      vdd => vdd,
      vss => vss
   );

not_word_in_4_ins : inv_x2
   port map (
      i   => word_in(4),
      nq  => not_word_in(4),
      vdd => vdd,
      vss => vss
   );

not_word_in_3_ins : inv_x2
   port map (
      i   => word_in(3),
      nq  => not_word_in(3),
      vdd => vdd,
      vss => vss
   );

not_word_in_2_ins : inv_x2
   port map (
      i   => word_in(2),
      nq  => not_word_in(2),
      vdd => vdd,
      vss => vss
   );

not_word_in_1_ins : inv_x2
   port map (
      i   => word_in(1),
      nq  => not_word_in(1),
      vdd => vdd,
      vss => vss
   );

aux6_ins : no2_x1
   port map (
      i0  => reset,
      i1  => frame_decoder_cs(1),
      nq  => aux6,
      vdd => vdd,
      vss => vss
   );

no4_x1_ins : no4_x1
   port map (
      i0  => not_word_in(7),
      i1  => word_in(3),
      i2  => word_in(6),
      i3  => word_in(5),
      nq  => no4_x1_sig,
      vdd => vdd,
      vss => vss
   );

no4_x1_2_ins : no4_x1
   port map (
      i0  => word_in(0),
      i1  => word_in(4),
      i2  => word_in(2),
      i3  => word_in(1),
      nq  => no4_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

na4_x1_ins : na4_x1
   port map (
      i0  => no4_x1_2_sig,
      i1  => no4_x1_sig,
      i2  => frame_decoder_cs(0),
      i3  => not_frame_decoder_cs(2),
      nq  => na4_x1_sig,
      vdd => vdd,
      vss => vss
   );

no4_x1_3_ins : no4_x1
   port map (
      i0  => not_word_in(5),
      i1  => not_word_in(3),
      i2  => not_word_in(6),
      i3  => word_in(7),
      nq  => no4_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

no4_x1_4_ins : no4_x1
   port map (
      i0  => not_word_in(4),
      i1  => not_word_in(2),
      i2  => not_word_in(1),
      i3  => word_in(0),
      nq  => no4_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_ins : na3_x1
   port map (
      i0  => no4_x1_4_sig,
      i1  => no4_x1_3_sig,
      i2  => not_frame_decoder_cs(0),
      nq  => na3_x1_sig,
      vdd => vdd,
      vss => vss
   );

a3_x2_ins : a3_x2
   port map (
      i0  => na3_x1_sig,
      i1  => not_aux3,
      i2  => na4_x1_sig,
      q   => a3_x2_sig,
      vdd => vdd,
      vss => vss
   );

inv_x2_ins : inv_x2
   port map (
      i   => aux6,
      nq  => inv_x2_sig,
      vdd => vdd,
      vss => vss
   );

nao2o22_x1_ins : nao2o22_x1
   port map (
      i0  => inv_x2_sig,
      i1  => a3_x2_sig,
      i2  => not_aux4,
      i3  => not_frame_decoder_cs(3),
      nq  => nao2o22_x1_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_ins : o2_x2
   port map (
      i0  => reset,
      i1  => not_aux3,
      q   => o2_x2_sig,
      vdd => vdd,
      vss => vss
   );

na4_x1_3_ins : na4_x1
   port map (
      i0  => not_word_in(6),
      i1  => word_in(7),
      i2  => not_word_in(3),
      i3  => not_word_in(5),
      nq  => na4_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_3_ins : na3_x1
   port map (
      i0  => not_word_in(4),
      i1  => not_word_in(2),
      i2  => not_word_in(1),
      nq  => na3_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_ins : no2_x1
   port map (
      i0  => na3_x1_3_sig,
      i1  => na4_x1_3_sig,
      nq  => no2_x1_sig,
      vdd => vdd,
      vss => vss
   );

na4_x1_2_ins : na4_x1
   port map (
      i0  => frame_decoder_cs(0),
      i1  => not_frame_decoder_cs(2),
      i2  => no2_x1_sig,
      i3  => aux6,
      nq  => na4_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_2_ins : na3_x1
   port map (
      i0  => not_aux5,
      i1  => na4_x1_2_sig,
      i2  => o2_x2_sig,
      nq  => na3_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

oa22_x2_ins : oa22_x2
   port map (
      i0  => not_frame_decoder_cs(3),
      i1  => frame_decoder_cs(0),
      i2  => reset,
      q   => oa22_x2_sig,
      vdd => vdd,
      vss => vss
   );

noa22_x1_ins : noa22_x1
   port map (
      i0  => not_aux3,
      i1  => not_frame_decoder_cs(1),
      i2  => oa22_x2_sig,
      nq  => noa22_x1_sig,
      vdd => vdd,
      vss => vss
   );

noa22_x1_2_ins : noa22_x1
   port map (
      i0  => frame_decoder_cs(2),
      i1  => frame_decoder_cs(3),
      i2  => frame_decoder_cs(1),
      nq  => noa22_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_ins : na2_x1
   port map (
      i0  => frame_decoder_cs(3),
      i1  => frame_decoder_cs(2),
      nq  => na2_x1_sig,
      vdd => vdd,
      vss => vss
   );

no2_x1_2_ins : no2_x1
   port map (
      i0  => not_frame_decoder_cs(0),
      i1  => na2_x1_sig,
      nq  => no2_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

no3_x1_ins : no3_x1
   port map (
      i0  => no2_x1_2_sig,
      i1  => noa22_x1_2_sig,
      i2  => reset,
      nq  => no3_x1_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_4_ins : na3_x1
   port map (
      i0  => word_in(0),
      i1  => not_reset,
      i2  => frame_decoder_cs(3),
      nq  => na3_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

o2_x2_2_ins : o2_x2
   port map (
      i0  => frame_decoder_cs(0),
      i1  => not_frame_decoder_cs(2),
      q   => o2_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

data_0_ins : noa22_x1
   port map (
      i0  => o2_x2_2_sig,
      i1  => not_frame_decoder_cs(1),
      i2  => na3_x1_4_sig,
      nq  => data(0),
      vdd => vdd,
      vss => vss
   );

na2_x1_2_ins : na2_x1
   port map (
      i0  => word_in(1),
      i1  => not_reset,
      nq  => na2_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

data_1_ins : no2_x1
   port map (
      i0  => na2_x1_2_sig,
      i1  => not_aux8,
      nq  => data(1),
      vdd => vdd,
      vss => vss
   );

na2_x1_3_ins : na2_x1
   port map (
      i0  => word_in(2),
      i1  => not_reset,
      nq  => na2_x1_3_sig,
      vdd => vdd,
      vss => vss
   );

data_2_ins : no2_x1
   port map (
      i0  => na2_x1_3_sig,
      i1  => not_aux8,
      nq  => data(2),
      vdd => vdd,
      vss => vss
   );

na2_x1_4_ins : na2_x1
   port map (
      i0  => word_in(3),
      i1  => not_reset,
      nq  => na2_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

data_3_ins : no2_x1
   port map (
      i0  => na2_x1_4_sig,
      i1  => not_aux8,
      nq  => data(3),
      vdd => vdd,
      vss => vss
   );

na2_x1_5_ins : na2_x1
   port map (
      i0  => word_in(4),
      i1  => not_reset,
      nq  => na2_x1_5_sig,
      vdd => vdd,
      vss => vss
   );

data_4_ins : no2_x1
   port map (
      i0  => na2_x1_5_sig,
      i1  => not_aux8,
      nq  => data(4),
      vdd => vdd,
      vss => vss
   );

na2_x1_6_ins : na2_x1
   port map (
      i0  => word_in(5),
      i1  => not_reset,
      nq  => na2_x1_6_sig,
      vdd => vdd,
      vss => vss
   );

data_5_ins : no2_x1
   port map (
      i0  => na2_x1_6_sig,
      i1  => not_aux8,
      nq  => data(5),
      vdd => vdd,
      vss => vss
   );

na2_x1_7_ins : na2_x1
   port map (
      i0  => word_in(6),
      i1  => not_reset,
      nq  => na2_x1_7_sig,
      vdd => vdd,
      vss => vss
   );

data_6_ins : no2_x1
   port map (
      i0  => na2_x1_7_sig,
      i1  => not_aux8,
      nq  => data(6),
      vdd => vdd,
      vss => vss
   );

na2_x1_8_ins : na2_x1
   port map (
      i0  => word_in(7),
      i1  => not_reset,
      nq  => na2_x1_8_sig,
      vdd => vdd,
      vss => vss
   );

data_7_ins : no2_x1
   port map (
      i0  => na2_x1_8_sig,
      i1  => not_aux8,
      nq  => data(7),
      vdd => vdd,
      vss => vss
   );

address_0_ins : an12_x1
   port map (
      i0  => not_aux5,
      i1  => word_in(0),
      q   => address(0),
      vdd => vdd,
      vss => vss
   );

address_1_ins : no3_x1
   port map (
      i0  => not_word_in(1),
      i1  => not_aux4,
      i2  => frame_decoder_cs(3),
      nq  => address(1),
      vdd => vdd,
      vss => vss
   );

address_2_ins : no3_x1
   port map (
      i0  => not_word_in(2),
      i1  => not_aux4,
      i2  => frame_decoder_cs(3),
      nq  => address(2),
      vdd => vdd,
      vss => vss
   );

address_3_ins : no3_x1
   port map (
      i0  => not_word_in(3),
      i1  => not_aux4,
      i2  => frame_decoder_cs(3),
      nq  => address(3),
      vdd => vdd,
      vss => vss
   );

address_4_ins : no3_x1
   port map (
      i0  => not_word_in(4),
      i1  => not_aux4,
      i2  => frame_decoder_cs(3),
      nq  => address(4),
      vdd => vdd,
      vss => vss
   );

address_5_ins : no3_x1
   port map (
      i0  => not_word_in(5),
      i1  => not_aux4,
      i2  => frame_decoder_cs(3),
      nq  => address(5),
      vdd => vdd,
      vss => vss
   );

address_6_ins : no3_x1
   port map (
      i0  => not_word_in(6),
      i1  => not_aux4,
      i2  => frame_decoder_cs(3),
      nq  => address(6),
      vdd => vdd,
      vss => vss
   );

address_7_ins : no3_x1
   port map (
      i0  => not_word_in(7),
      i1  => not_aux4,
      i2  => frame_decoder_cs(3),
      nq  => address(7),
      vdd => vdd,
      vss => vss
   );

na2_x1_9_ins : na2_x1
   port map (
      i0  => not_reset,
      i1  => not_frame_decoder_cs(1),
      nq  => na2_x1_9_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_10_ins : na2_x1
   port map (
      i0  => not_word_in(6),
      i1  => not_word_in(2),
      nq  => na2_x1_10_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_5_ins : na3_x1
   port map (
      i0  => not_word_in(3),
      i1  => word_in(7),
      i2  => not_word_in(5),
      nq  => na3_x1_5_sig,
      vdd => vdd,
      vss => vss
   );

na2_x1_11_ins : na2_x1
   port map (
      i0  => not_word_in(4),
      i1  => not_word_in(1),
      nq  => na2_x1_11_sig,
      vdd => vdd,
      vss => vss
   );

no3_x1_2_ins : no3_x1
   port map (
      i0  => na2_x1_11_sig,
      i1  => na3_x1_5_sig,
      i2  => na2_x1_10_sig,
      nq  => no3_x1_2_sig,
      vdd => vdd,
      vss => vss
   );

o3_x2_ins : o3_x2
   port map (
      i0  => frame_decoder_cs(2),
      i1  => no3_x1_2_sig,
      i2  => not_frame_decoder_cs(0),
      q   => o3_x2_sig,
      vdd => vdd,
      vss => vss
   );

na4_x1_4_ins : na4_x1
   port map (
      i0  => word_in(7),
      i1  => word_in(5),
      i2  => word_in(6),
      i3  => not_word_in(3),
      nq  => na4_x1_4_sig,
      vdd => vdd,
      vss => vss
   );

na3_x1_6_ins : na3_x1
   port map (
      i0  => word_in(2),
      i1  => word_in(0),
      i2  => not_word_in(4),
      nq  => na3_x1_6_sig,
      vdd => vdd,
      vss => vss
   );

o3_x2_2_ins : o3_x2
   port map (
      i0  => not_word_in(1),
      i1  => na3_x1_6_sig,
      i2  => na4_x1_4_sig,
      q   => o3_x2_2_sig,
      vdd => vdd,
      vss => vss
   );

on12_x1_ins : on12_x1
   port map (
      i0  => o3_x2_2_sig,
      i1  => not_frame_decoder_cs(2),
      q   => on12_x1_sig,
      vdd => vdd,
      vss => vss
   );

err_ins : noa22_x1
   port map (
      i0  => on12_x1_sig,
      i1  => o3_x2_sig,
      i2  => na2_x1_9_sig,
      nq  => err,
      vdd => vdd,
      vss => vss
   );

frame_decoder_cs_0_ins_scan_0 : sff2_x4
   port map (
      ck  => clk,
      cmd => scantest,
      i0  => nao2o22_x1_sig,
      i1  => scanin,
      q   => frame_decoder_cs(0),
      vdd => vdd,
      vss => vss
   );

frame_decoder_cs_1_ins_scan_1 : sff2_x4
   port map (
      ck  => clk,
      cmd => scantest,
      i0  => na3_x1_2_sig,
      i1  => frame_decoder_cs(0),
      q   => frame_decoder_cs(1),
      vdd => vdd,
      vss => vss
   );

frame_decoder_cs_2_ins_scan_2 : sff2_x4
   port map (
      ck  => clk,
      cmd => scantest,
      i0  => noa22_x1_sig,
      i1  => frame_decoder_cs(1),
      q   => frame_decoder_cs(2),
      vdd => vdd,
      vss => vss
   );

frame_decoder_cs_3_ins_scan_3 : sff2_x4
   port map (
      ck  => clk,
      cmd => scantest,
      i0  => no3_x1_sig,
      i1  => frame_decoder_cs(2),
      q   => frame_decoder_cs(3),
      vdd => vdd,
      vss => vss
   );

buf_scan_4 : buf_x2
   port map (
      i   => frame_decoder_cs(3),
      q   => scanout,
      vdd => vdd,
      vss => vss
   );


end structural;
