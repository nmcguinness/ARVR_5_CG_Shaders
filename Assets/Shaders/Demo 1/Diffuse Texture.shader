Shader "ARVR/Diffuse Texture" {
	Properties{
		//[NoScaleOffset]
		 _MainTex("Texture", 2D) = "white" {}

	//[Normal]
	//[NoScaleOffset]
	//_BumpMap("Bumpmap (RGB) ", 2D) = "bump" {}

	//[HideInInspector]
	//_ValueMultiplier("Some Value", Range(0,1.5)) = 0.5

	//[HDR]
	//_RefrColor("Refraction color", Color) = (.34, .85, .92, 1) // color
	}
		SubShader{
		  Tags { "RenderType" = "Transparent"}
		  CGPROGRAM
		  #pragma surface surf Lambert
		  struct Input {
			  float2 uv_MainTex;
		  };

	  sampler2D _MainTex;
	  float _Alpha;

	  void surf(Input IN, inout SurfaceOutput o) {
		  //Cg and HLSL we can swizzle (float4, fixed4)
		  o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
	  }
	  ENDCG
	}
		Fallback "Diffuse"
}