Shader "CookbookShaders/BasicDiffuse"
{
    Properties
    {  
        _EmissiveColor ("Emissive Color", Color) = (1,1,1,1)
        _AmbientColor ("Ambient Color", Color) = (1,1,1,1)
        _MySlider ("My Slideer", Range(1, 10)) = 5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM

        #pragma surface surf Standard fullforwardshadows


        float4 _EmissiveColor;
        float4 _AmbientColor;
        float _MySlider;

        struct Input   
        {  
            float2 uv_MainTex;  
        };

        

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float4 c;
            c = pow((_EmissiveColor + _AmbientColor), _MySlider);
            o.Albedo = c.rgb;
            o.Alpha = c.a;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
