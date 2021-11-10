Shader "ARVR/Normal To Color"
{
	Properties{
	}
	SubShader{
	  Tags { "RenderType" = "Opaque" }
	  CGPROGRAM
	  #pragma surface surf Lambert vertex:vert
	  struct Input {
		  float2 uv_MainTex;
		  float3 customColor;
	  };
	  void vert(inout appdata_full v, out Input o) {
		  UNITY_INITIALIZE_OUTPUT(Input,o);
		  o.customColor = abs(v.normal);
	  }
	  sampler2D _MainTex;
	  void surf(Input IN, inout SurfaceOutput o) {
		  o.Albedo = IN.customColor;
	  }
	  ENDCG
	}
		Fallback "Diffuse"
}