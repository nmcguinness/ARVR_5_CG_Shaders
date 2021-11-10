Shader "ARVR/Diffuse Texture" {
	Properties{
	  _MainTex("Texture", 2D) = "white" {}

	_Alpha("Alpha", Range(0, 1)) = 1 // sliders
	}
		SubShader{
		  Tags { "RenderType" = "Transparent"}
		  CGPROGRAM
		  #pragma surface surf Lambert
		  struct Input {
			  float2 uv_MainTex;
		  };

	//Paint brush (how we sample? (point, bilinear, trilinear, anisotropic)
	//UV (clamp, mirror, wrap)
	  sampler2D _MainTex;
	  float _Alpha;

	  void surf(Input IN, inout SurfaceOutput o) {
		  //Cg and HLSL we can swizzle (float4, fixed4)
		  o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		  o.Alpha = 0;
	  }
	  ENDCG
	}
		Fallback "Diffuse"
}