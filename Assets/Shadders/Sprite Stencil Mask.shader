﻿Shader "Custom/Sprite Stencil Mask" {
	Properties{
	[PerRendererData]  _MainTex("Sprite Texture", 2D) = "white" { }
	 _Color("Tint", Color) = (1.000000,1.000000,1.000000,1.000000)
	[MaterialToggle]  PixelSnap("Pixel snap", Float) = 0.000000
	[HideInInspector]  _RendererColor("RendererColor", Color) = (1.000000,1.000000,1.000000,1.000000)
	[HideInInspector]  _Flip("Flip", Vector) = (1.000000,1.000000,1.000000,1.000000)
	[PerRendererData]  _AlphaTex("External Alpha", 2D) = "white" { }
	[PerRendererData]  _EnableExternalAlpha("Enable External Alpha", Float) = 0.000000
	}
		SubShader{
		 Tags { "QUEUE" = "Transparent" "IGNOREPROJECTOR" = "true" "RenderType" = "Transparent" "PreviewType" = "Plane" "CanUseSpriteAtlas" = "true" /*"Queue" = "Geometry-100"*/}
		 /*ColorMask 0
		ZWrite off
		LOD 200

		Stencil {
			Ref 1
			Pass replace
		}*/

		 // Stats for Vertex shader:
		 //        d3d11: 14 avg math (11..17)
		 // Stats for Fragment shader:
		 //        d3d11: 3 avg math (2..4), 1 avg texture (1..2)
		 Pass {
		  Tags { "QUEUE" = "Transparent" "IGNOREPROJECTOR" = "true" "RenderType" = "Transparent" "PreviewType" = "Plane" "CanUseSpriteAtlas" = "true" }
		  ZWrite Off
		  Cull Off
		  Blend One OneMinusSrcAlpha
		//////////////////////////////////
		//                              //
		//      Compiled programs       //
		//                              //
		//////////////////////////////////
	  //////////////////////////////////////////////////////
	  No keywords set in this variant.
	  --Hardware tier variant : Tier 1
	  --Vertex shader for "d3d11" :
		// Stats: 11 math, 2 temp registers
		Uses vertex data channel "Vertex"
		Uses vertex data channel "Tangent"
		Uses vertex data channel "TexCoord"

		Constant Buffer "$Globals" (48 bytes) on slot 0 {
		  Vector4 _Color at 32
		}
		Constant Buffer "UnityPerDraw" (160 bytes) on slot 1 {
		  Matrix4x4 unity_ObjectToWorld at 0
		}
		Constant Buffer "UnityPerFrame" (368 bytes) on slot 2 {
		  Matrix4x4 unity_MatrixVP at 272
		}
		Constant Buffer "UnityPerDrawSprite" (32 bytes) on slot 3 {
		  Vector4 _RendererColor at 0
		  Vector2 _Flip at 16
		}

		Shader Disassembly :
		//
		// Generated by Microsoft (R) D3D Shader Disassembler
		//
		//
		// Input signature:
		//
		// Name                 Index   Mask Register SysValue  Format   Used
		// -------------------- ----- ------ -------- -------- ------- ------
		// POSITION                 0   xyzw        0     NONE   float   xyz 
		// COLOR                    0   xyzw        1     NONE   float   xyzw
		// TEXCOORD                 0   xy          2     NONE   float   xy  
		//
		//
		// Output signature:
		//
		// Name                 Index   Mask Register SysValue  Format   Used
		// -------------------- ----- ------ -------- -------- ------- ------
		// SV_POSITION              0   xyzw        0      POS   float   xyzw
		// COLOR                    0   xyzw        1     NONE   float   xyzw
		// TEXCOORD                 0   xy          2     NONE   float   xy  
		//
			  vs_4_0
			  dcl_constantbuffer CB0[3], immediateIndexed
			  dcl_constantbuffer CB1[4], immediateIndexed
			  dcl_constantbuffer CB2[21], immediateIndexed
			  dcl_constantbuffer CB3[2], immediateIndexed
			  dcl_input v0.xyz
			  dcl_input v1.xyzw
			  dcl_input v2.xy
			  dcl_output_siv o0.xyzw, position
			  dcl_output o1.xyzw
			  dcl_output o2.xy
			  dcl_temps 2
		   0: mul r0.xy, v0.xyxx, cb3[1].xyxx
		   1 : mul r1.xyzw, r0.yyyy, cb1[1].xyzw
		   2 : mad r0.xyzw, cb1[0].xyzw, r0.xxxx, r1.xyzw
		   3 : mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
		   4 : add r0.xyzw, r0.xyzw, cb1[3].xyzw
		   5 : mul r1.xyzw, r0.yyyy, cb2[18].xyzw
		   6 : mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
		   7 : mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
		   8 : mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
		   9 : mul r0.xyzw, v1.xyzw, cb0[2].xyzw
		  10 : mul o1.xyzw, r0.xyzw, cb3[0].xyzw
		  11 : mov o2.xy, v2.xyxx
		  12 : ret
				  // Approximately 0 instruction slots used


				  -- Hardware tier variant : Tier 1
				  --Fragment shader for "d3d11" :
				  // Stats: 2 math, 1 temp registers, 1 textures
				  Set 2D Texture "_MainTex" to slot 0

				  Shader Disassembly :
			  //
			  // Generated by Microsoft (R) D3D Shader Disassembler
			  //
			  //
			  // Input signature:
			  //
			  // Name                 Index   Mask Register SysValue  Format   Used
			  // -------------------- ----- ------ -------- -------- ------- ------
			  // SV_POSITION              0   xyzw        0      POS   float       
			  // COLOR                    0   xyzw        1     NONE   float   xyzw
			  // TEXCOORD                 0   xy          2     NONE   float   xy  
			  //
			  //
			  // Output signature:
			  //
			  // Name                 Index   Mask Register SysValue  Format   Used
			  // -------------------- ----- ------ -------- -------- ------- ------
			  // SV_Target                0   xyzw        0   TARGET   float   xyzw
			  //
					ps_4_0
					dcl_sampler s0, mode_default
					dcl_resource_texture2d(float,float,float,float) t0
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v2.xy
					dcl_output o0.xyzw
					dcl_temps 1
				 0: sample r0.xyzw, v2.xyxx, t0.xyzw, s0
				 1 : mul r0.xyzw, r0.xyzw, v1.xyzw
				 2 : mul o0.xyz, r0.wwww, r0.xyzx
				 3 : mov o0.w, r0.w
				 4 : ret
						// Approximately 0 instruction slots used


						//////////////////////////////////////////////////////
						Keywords set in this variant : ETC1_EXTERNAL_ALPHA
						-- Hardware tier variant : Tier 1
						--Vertex shader for "d3d11" :
						// Stats: 11 math, 2 temp registers
						Uses vertex data channel "Vertex"
						Uses vertex data channel "Tangent"
						Uses vertex data channel "TexCoord"

						Constant Buffer "$Globals" (48 bytes) on slot 0 {
						  Vector4 _Color at 32
						}
						Constant Buffer "UnityPerDraw" (160 bytes) on slot 1 {
						  Matrix4x4 unity_ObjectToWorld at 0
						}
						Constant Buffer "UnityPerFrame" (368 bytes) on slot 2 {
						  Matrix4x4 unity_MatrixVP at 272
						}
						Constant Buffer "UnityPerDrawSprite" (32 bytes) on slot 3 {
						  Vector4 _RendererColor at 0
						  Vector2 _Flip at 16
						}

						Shader Disassembly :
						//
						// Generated by Microsoft (R) D3D Shader Disassembler
						//
						//
						// Input signature:
						//
						// Name                 Index   Mask Register SysValue  Format   Used
						// -------------------- ----- ------ -------- -------- ------- ------
						// POSITION                 0   xyzw        0     NONE   float   xyz 
						// COLOR                    0   xyzw        1     NONE   float   xyzw
						// TEXCOORD                 0   xy          2     NONE   float   xy  
						//
						//
						// Output signature:
						//
						// Name                 Index   Mask Register SysValue  Format   Used
						// -------------------- ----- ------ -------- -------- ------- ------
						// SV_POSITION              0   xyzw        0      POS   float   xyzw
						// COLOR                    0   xyzw        1     NONE   float   xyzw
						// TEXCOORD                 0   xy          2     NONE   float   xy  
						//
							  vs_4_0
							  dcl_constantbuffer CB0[3], immediateIndexed
							  dcl_constantbuffer CB1[4], immediateIndexed
							  dcl_constantbuffer CB2[21], immediateIndexed
							  dcl_constantbuffer CB3[2], immediateIndexed
							  dcl_input v0.xyz
							  dcl_input v1.xyzw
							  dcl_input v2.xy
							  dcl_output_siv o0.xyzw, position
							  dcl_output o1.xyzw
							  dcl_output o2.xy
							  dcl_temps 2
						   0: mul r0.xy, v0.xyxx, cb3[1].xyxx
						   1 : mul r1.xyzw, r0.yyyy, cb1[1].xyzw
						   2 : mad r0.xyzw, cb1[0].xyzw, r0.xxxx, r1.xyzw
						   3 : mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
						   4 : add r0.xyzw, r0.xyzw, cb1[3].xyzw
						   5 : mul r1.xyzw, r0.yyyy, cb2[18].xyzw
						   6 : mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
						   7 : mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
						   8 : mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
						   9 : mul r0.xyzw, v1.xyzw, cb0[2].xyzw
						  10 : mul o1.xyzw, r0.xyzw, cb3[0].xyzw
						  11 : mov o2.xy, v2.xyxx
						  12 : ret
								  // Approximately 0 instruction slots used


								  -- Hardware tier variant : Tier 1
								  --Fragment shader for "d3d11" :
								  // Stats: 4 math, 2 temp registers, 2 textures
								  Set 2D Texture "_MainTex" to slot 0
								  Set 2D Texture "_AlphaTex" to slot 1

								  Constant Buffer "UnityPerDrawSprite" (32 bytes) on slot 0 {
									Float _EnableExternalAlpha at 24
								  }

								  Shader Disassembly :
								  //
								  // Generated by Microsoft (R) D3D Shader Disassembler
								  //
								  //
								  // Input signature:
								  //
								  // Name                 Index   Mask Register SysValue  Format   Used
								  // -------------------- ----- ------ -------- -------- ------- ------
								  // SV_POSITION              0   xyzw        0      POS   float       
								  // COLOR                    0   xyzw        1     NONE   float   xyzw
								  // TEXCOORD                 0   xy          2     NONE   float   xy  
								  //
								  //
								  // Output signature:
								  //
								  // Name                 Index   Mask Register SysValue  Format   Used
								  // -------------------- ----- ------ -------- -------- ------- ------
								  // SV_Target                0   xyzw        0   TARGET   float   xyzw
								  //
										ps_4_0
										dcl_constantbuffer CB0[2], immediateIndexed
										dcl_sampler s0, mode_default
										dcl_sampler s1, mode_default
										dcl_resource_texture2d(float,float,float,float) t0
										dcl_resource_texture2d(float,float,float,float) t1
										dcl_input_ps linear v1.xyzw
										dcl_input_ps linear v2.xy
										dcl_output o0.xyzw
										dcl_temps 2
									 0: sample r0.xyzw, v2.xyxx, t1.xyzw, s1
									 1 : sample r1.xyzw, v2.xyxx, t0.xyzw, s0
									 2 : add r0.x, r0.x, -r1.w
									 3 : mad r1.w, cb0[1].z, r0.x, r1.w
									 4 : mul r0.xyzw, r1.xyzw, v1.xyzw
									 5 : mul o0.xyz, r0.wwww, r0.xyzx
									 6 : mov o0.w, r0.w
									 7 : ret
											// Approximately 0 instruction slots used


											//////////////////////////////////////////////////////
											Keywords set in this variant : PIXELSNAP_ON
											-- Hardware tier variant : Tier 1
											--Vertex shader for "d3d11" :
											// Stats: 17 math, 2 temp registers
											Uses vertex data channel "Vertex"
											Uses vertex data channel "Tangent"
											Uses vertex data channel "TexCoord"

											Constant Buffer "$Globals" (48 bytes) on slot 0 {
											  Vector4 _Color at 32
											}
											Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
											  Vector4 _ScreenParams at 96
											}
											Constant Buffer "UnityPerDraw" (160 bytes) on slot 2 {
											  Matrix4x4 unity_ObjectToWorld at 0
											}
											Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
											  Matrix4x4 unity_MatrixVP at 272
											}
											Constant Buffer "UnityPerDrawSprite" (32 bytes) on slot 4 {
											  Vector4 _RendererColor at 0
											  Vector2 _Flip at 16
											}

											Shader Disassembly :
											//
											// Generated by Microsoft (R) D3D Shader Disassembler
											//
											//
											// Input signature:
											//
											// Name                 Index   Mask Register SysValue  Format   Used
											// -------------------- ----- ------ -------- -------- ------- ------
											// POSITION                 0   xyzw        0     NONE   float   xyz 
											// COLOR                    0   xyzw        1     NONE   float   xyzw
											// TEXCOORD                 0   xy          2     NONE   float   xy  
											//
											//
											// Output signature:
											//
											// Name                 Index   Mask Register SysValue  Format   Used
											// -------------------- ----- ------ -------- -------- ------- ------
											// SV_POSITION              0   xyzw        0      POS   float   xyzw
											// COLOR                    0   xyzw        1     NONE   float   xyzw
											// TEXCOORD                 0   xy          2     NONE   float   xy  
											//
												  vs_4_0
												  dcl_constantbuffer CB0[3], immediateIndexed
												  dcl_constantbuffer CB1[7], immediateIndexed
												  dcl_constantbuffer CB2[4], immediateIndexed
												  dcl_constantbuffer CB3[21], immediateIndexed
												  dcl_constantbuffer CB4[2], immediateIndexed
												  dcl_input v0.xyz
												  dcl_input v1.xyzw
												  dcl_input v2.xy
												  dcl_output_siv o0.xyzw, position
												  dcl_output o1.xyzw
												  dcl_output o2.xy
												  dcl_temps 2
											   0: mul r0.xy, v0.xyxx, cb4[1].xyxx
											   1 : mul r1.xyzw, r0.yyyy, cb2[1].xyzw
											   2 : mad r0.xyzw, cb2[0].xyzw, r0.xxxx, r1.xyzw
											   3 : mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
											   4 : add r0.xyzw, r0.xyzw, cb2[3].xyzw
											   5 : mul r1.xyzw, r0.yyyy, cb3[18].xyzw
											   6 : mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
											   7 : mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
											   8 : mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
											   9 : div r0.xy, r0.xyxx, r0.wwww
											  10 : mul r1.xy, cb1[6].xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
											  11 : mul r0.xy, r0.xyxx, r1.xyxx
											  12 : round_ne r0.xy, r0.xyxx
											  13 : div r0.xy, r0.xyxx, r1.xyxx
											  14 : mul o0.xy, r0.wwww, r0.xyxx
											  15 : mov o0.zw, r0.zzzw
											  16 : mul r0.xyzw, v1.xyzw, cb0[2].xyzw
											  17 : mul o1.xyzw, r0.xyzw, cb4[0].xyzw
											  18 : mov o2.xy, v2.xyxx
											  19 : ret
													  // Approximately 0 instruction slots used


													  -- Hardware tier variant : Tier 1
													  --Fragment shader for "d3d11" :
													  // Stats: 2 math, 1 temp registers, 1 textures
													  Set 2D Texture "_MainTex" to slot 0

													  Shader Disassembly :
												  //
												  // Generated by Microsoft (R) D3D Shader Disassembler
												  //
												  //
												  // Input signature:
												  //
												  // Name                 Index   Mask Register SysValue  Format   Used
												  // -------------------- ----- ------ -------- -------- ------- ------
												  // SV_POSITION              0   xyzw        0      POS   float       
												  // COLOR                    0   xyzw        1     NONE   float   xyzw
												  // TEXCOORD                 0   xy          2     NONE   float   xy  
												  //
												  //
												  // Output signature:
												  //
												  // Name                 Index   Mask Register SysValue  Format   Used
												  // -------------------- ----- ------ -------- -------- ------- ------
												  // SV_Target                0   xyzw        0   TARGET   float   xyzw
												  //
														ps_4_0
														dcl_sampler s0, mode_default
														dcl_resource_texture2d(float,float,float,float) t0
														dcl_input_ps linear v1.xyzw
														dcl_input_ps linear v2.xy
														dcl_output o0.xyzw
														dcl_temps 1
													 0: sample r0.xyzw, v2.xyxx, t0.xyzw, s0
													 1 : mul r0.xyzw, r0.xyzw, v1.xyzw
													 2 : mul o0.xyz, r0.wwww, r0.xyzx
													 3 : mov o0.w, r0.w
													 4 : ret
															// Approximately 0 instruction slots used


															//////////////////////////////////////////////////////
															Keywords set in this variant : ETC1_EXTERNAL_ALPHA PIXELSNAP_ON
															-- Hardware tier variant : Tier 1
															--Vertex shader for "d3d11" :
															// Stats: 17 math, 2 temp registers
															Uses vertex data channel "Vertex"
															Uses vertex data channel "Tangent"
															Uses vertex data channel "TexCoord"

															Constant Buffer "$Globals" (48 bytes) on slot 0 {
															  Vector4 _Color at 32
															}
															Constant Buffer "UnityPerCamera" (144 bytes) on slot 1 {
															  Vector4 _ScreenParams at 96
															}
															Constant Buffer "UnityPerDraw" (160 bytes) on slot 2 {
															  Matrix4x4 unity_ObjectToWorld at 0
															}
															Constant Buffer "UnityPerFrame" (368 bytes) on slot 3 {
															  Matrix4x4 unity_MatrixVP at 272
															}
															Constant Buffer "UnityPerDrawSprite" (32 bytes) on slot 4 {
															  Vector4 _RendererColor at 0
															  Vector2 _Flip at 16
															}

															Shader Disassembly :
															//
															// Generated by Microsoft (R) D3D Shader Disassembler
															//
															//
															// Input signature:
															//
															// Name                 Index   Mask Register SysValue  Format   Used
															// -------------------- ----- ------ -------- -------- ------- ------
															// POSITION                 0   xyzw        0     NONE   float   xyz 
															// COLOR                    0   xyzw        1     NONE   float   xyzw
															// TEXCOORD                 0   xy          2     NONE   float   xy  
															//
															//
															// Output signature:
															//
															// Name                 Index   Mask Register SysValue  Format   Used
															// -------------------- ----- ------ -------- -------- ------- ------
															// SV_POSITION              0   xyzw        0      POS   float   xyzw
															// COLOR                    0   xyzw        1     NONE   float   xyzw
															// TEXCOORD                 0   xy          2     NONE   float   xy  
															//
																  vs_4_0
																  dcl_constantbuffer CB0[3], immediateIndexed
																  dcl_constantbuffer CB1[7], immediateIndexed
																  dcl_constantbuffer CB2[4], immediateIndexed
																  dcl_constantbuffer CB3[21], immediateIndexed
																  dcl_constantbuffer CB4[2], immediateIndexed
																  dcl_input v0.xyz
																  dcl_input v1.xyzw
																  dcl_input v2.xy
																  dcl_output_siv o0.xyzw, position
																  dcl_output o1.xyzw
																  dcl_output o2.xy
																  dcl_temps 2
															   0: mul r0.xy, v0.xyxx, cb4[1].xyxx
															   1 : mul r1.xyzw, r0.yyyy, cb2[1].xyzw
															   2 : mad r0.xyzw, cb2[0].xyzw, r0.xxxx, r1.xyzw
															   3 : mad r0.xyzw, cb2[2].xyzw, v0.zzzz, r0.xyzw
															   4 : add r0.xyzw, r0.xyzw, cb2[3].xyzw
															   5 : mul r1.xyzw, r0.yyyy, cb3[18].xyzw
															   6 : mad r1.xyzw, cb3[17].xyzw, r0.xxxx, r1.xyzw
															   7 : mad r1.xyzw, cb3[19].xyzw, r0.zzzz, r1.xyzw
															   8 : mad r0.xyzw, cb3[20].xyzw, r0.wwww, r1.xyzw
															   9 : div r0.xy, r0.xyxx, r0.wwww
															  10 : mul r1.xy, cb1[6].xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
															  11 : mul r0.xy, r0.xyxx, r1.xyxx
															  12 : round_ne r0.xy, r0.xyxx
															  13 : div r0.xy, r0.xyxx, r1.xyxx
															  14 : mul o0.xy, r0.wwww, r0.xyxx
															  15 : mov o0.zw, r0.zzzw
															  16 : mul r0.xyzw, v1.xyzw, cb0[2].xyzw
															  17 : mul o1.xyzw, r0.xyzw, cb4[0].xyzw
															  18 : mov o2.xy, v2.xyxx
															  19 : ret
																	  // Approximately 0 instruction slots used


																	  -- Hardware tier variant : Tier 1
																	  --Fragment shader for "d3d11" :
																	  // Stats: 4 math, 2 temp registers, 2 textures
																	  Set 2D Texture "_MainTex" to slot 0
																	  Set 2D Texture "_AlphaTex" to slot 1

																	  Constant Buffer "UnityPerDrawSprite" (32 bytes) on slot 0 {
																		Float _EnableExternalAlpha at 24
																	  }

																	  Shader Disassembly :
																	  //
																	  // Generated by Microsoft (R) D3D Shader Disassembler
																	  //
																	  //
																	  // Input signature:
																	  //
																	  // Name                 Index   Mask Register SysValue  Format   Used
																	  // -------------------- ----- ------ -------- -------- ------- ------
																	  // SV_POSITION              0   xyzw        0      POS   float       
																	  // COLOR                    0   xyzw        1     NONE   float   xyzw
																	  // TEXCOORD                 0   xy          2     NONE   float   xy  
																	  //
																	  //
																	  // Output signature:
																	  //
																	  // Name                 Index   Mask Register SysValue  Format   Used
																	  // -------------------- ----- ------ -------- -------- ------- ------
																	  // SV_Target                0   xyzw        0   TARGET   float   xyzw
																	  //
																			ps_4_0
																			dcl_constantbuffer CB0[2], immediateIndexed
																			dcl_sampler s0, mode_default
																			dcl_sampler s1, mode_default
																			dcl_resource_texture2d(float,float,float,float) t0
																			dcl_resource_texture2d(float,float,float,float) t1
																			dcl_input_ps linear v1.xyzw
																			dcl_input_ps linear v2.xy
																			dcl_output o0.xyzw
																			dcl_temps 2
																		 0: sample r0.xyzw, v2.xyxx, t1.xyzw, s1
																		 1 : sample r1.xyzw, v2.xyxx, t0.xyzw, s0
																		 2 : add r0.x, r0.x, -r1.w
																		 3 : mad r1.w, cb0[1].z, r0.x, r1.w
																		 4 : mul r0.xyzw, r1.xyzw, v1.xyzw
																		 5 : mul o0.xyz, r0.wwww, r0.xyzx
																		 6 : mov o0.w, r0.w
																		 7 : ret
																				// Approximately 0 instruction slots used


																				 }
	}
}