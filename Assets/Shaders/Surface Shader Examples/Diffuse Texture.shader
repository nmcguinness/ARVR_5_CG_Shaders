Shader "ARVR/Diffuse Texture" {
	Properties{
	  _MainTex("Texture", 2D) = "white" {}
	}
		SubShader{
		  Tags { "RenderType" = "Opaque" }
		  CGPROGRAM
		  #pragma surface surf Lambert
		  struct Input {
			  float2 uv_MainTex;
		  };

	//Paint brush (how we sample? (point, bilinear, trilinear, anisotropic)
	//UV (clamp, mirror, wrap)
	  sampler2D _MainTex;
	  void surf(Input IN, inout SurfaceOutput o) {
		  //Cg and HLSL we can swizzle (float4, fixed4)
		  o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
	  }
	  ENDCG
	}
		Fallback "Diffuse"
}