// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 230.4KB

// Skipping shader variants that would not be included into build of current scene.

Shader "Standard" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0,1)) = 0.5
 _Glossiness ("Smoothness", Range(0,1)) = 0.5
[Gamma]  _Metallic ("Metallic", Range(0,1)) = 0
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
 _BumpScale ("Scale", Float) = 1
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005,0.08)) = 0.02
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0,1)) = 1
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissionColor ("Color", Color) = (0,0,0,1)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1
 _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0
[HideInInspector]  _Mode ("__mode", Float) = 0
[HideInInspector]  _SrcBlend ("__src", Float) = 1
[HideInInspector]  _DstBlend ("__dst", Float) = 0
[HideInInspector]  _ZWrite ("__zw", Float) = 1
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //      opengl : 157 avg math (157..158), 4 avg texture (4..5), 9 branch
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 19283
Program "vp" {
SubProgram "opengl " {
// Stats: 157 math, 4 textures, 9 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec3 tmpvar_8;
  vec4 tmpvar_9;
  tmpvar_9 = (_Object2World * gl_Vertex);
  tmpvar_8 = tmpvar_9.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec3 x2_16;
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x2_16.x = dot (unity_SHBr, tmpvar_17);
  x2_16.y = dot (unity_SHBg, tmpvar_17);
  x2_16.z = dot (unity_SHBb, tmpvar_17);
  tmpvar_7.xyz = (x2_16 + (unity_SHC.xyz * (
    (tmpvar_15.x * tmpvar_15.x)
   - 
    (tmpvar_15.y * tmpvar_15.y)
  )));
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD8 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_5;
  float oneMinusReflectivity_6;
  vec3 tmpvar_7;
  tmpvar_7 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, vec3(_Metallic));
  oneMinusReflectivity_6 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * oneMinusReflectivity_6);
  float tmpvar_8;
  tmpvar_8 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  float tmpvar_9;
  tmpvar_9 = max (0.0, dot (tmpvar_2, _WorldSpaceLightPos0.xyz));
  vec3 tmpvar_10;
  vec3 tmpvar_11;
  tmpvar_11 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_2;
  vec3 x1_13;
  x1_13.x = dot (unity_SHAr, tmpvar_12);
  x1_13.y = dot (unity_SHAg, tmpvar_12);
  x1_13.z = dot (unity_SHAb, tmpvar_12);
  tmpvar_10 = (xlv_TEXCOORD5.xyz + x1_13);
  tmpvar_10 = (tmpvar_10 * tmpvar_8);
  vec3 tmpvar_14;
  tmpvar_14 = (tmpvar_3 - (2.0 * (
    dot (tmpvar_2, tmpvar_3)
   * tmpvar_2)));
  vec3 worldNormal_15;
  worldNormal_15 = tmpvar_14;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_16;
    tmpvar_16 = normalize(tmpvar_14);
    vec3 tmpvar_17;
    tmpvar_17 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_16);
    vec3 tmpvar_18;
    tmpvar_18 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_16);
    bvec3 tmpvar_19;
    tmpvar_19 = greaterThan (tmpvar_16, vec3(0.0, 0.0, 0.0));
    float tmpvar_20;
    if (tmpvar_19.x) {
      tmpvar_20 = tmpvar_17.x;
    } else {
      tmpvar_20 = tmpvar_18.x;
    };
    float tmpvar_21;
    if (tmpvar_19.y) {
      tmpvar_21 = tmpvar_17.y;
    } else {
      tmpvar_21 = tmpvar_18.y;
    };
    float tmpvar_22;
    if (tmpvar_19.z) {
      tmpvar_22 = tmpvar_17.z;
    } else {
      tmpvar_22 = tmpvar_18.z;
    };
    vec3 tmpvar_23;
    tmpvar_23 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_15 = (((
      (tmpvar_23 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD8) + (tmpvar_16 * 
      min (min (tmpvar_20, tmpvar_21), tmpvar_22)
    )) - tmpvar_23);
  };
  vec4 tmpvar_24;
  tmpvar_24.xyz = worldNormal_15;
  tmpvar_24.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_25;
  tmpvar_25 = textureCubeLod (unity_SpecCube0, worldNormal_15, tmpvar_24.w);
  vec3 tmpvar_26;
  tmpvar_26 = ((unity_SpecCube0_HDR.x * pow (tmpvar_25.w, unity_SpecCube0_HDR.y)) * tmpvar_25.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_27;
    worldNormal_27 = tmpvar_14;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_28;
      tmpvar_28 = normalize(tmpvar_14);
      vec3 tmpvar_29;
      tmpvar_29 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_28);
      vec3 tmpvar_30;
      tmpvar_30 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_28);
      bvec3 tmpvar_31;
      tmpvar_31 = greaterThan (tmpvar_28, vec3(0.0, 0.0, 0.0));
      float tmpvar_32;
      if (tmpvar_31.x) {
        tmpvar_32 = tmpvar_29.x;
      } else {
        tmpvar_32 = tmpvar_30.x;
      };
      float tmpvar_33;
      if (tmpvar_31.y) {
        tmpvar_33 = tmpvar_29.y;
      } else {
        tmpvar_33 = tmpvar_30.y;
      };
      float tmpvar_34;
      if (tmpvar_31.z) {
        tmpvar_34 = tmpvar_29.z;
      } else {
        tmpvar_34 = tmpvar_30.z;
      };
      vec3 tmpvar_35;
      tmpvar_35 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_27 = (((
        (tmpvar_35 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD8) + (tmpvar_28 * 
        min (min (tmpvar_32, tmpvar_33), tmpvar_34)
      )) - tmpvar_35);
    };
    vec4 tmpvar_36;
    tmpvar_36.xyz = worldNormal_27;
    tmpvar_36.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_37;
    tmpvar_37 = textureCubeLod (unity_SpecCube1, worldNormal_27, tmpvar_36.w);
    tmpvar_11 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_37.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_37.xyz), tmpvar_26, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_11 = tmpvar_26;
  };
  tmpvar_11 = (tmpvar_11 * tmpvar_8);
  vec3 viewDir_38;
  viewDir_38 = -(tmpvar_3);
  float tmpvar_39;
  tmpvar_39 = (1.0 - _Glossiness);
  vec3 tmpvar_40;
  vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  float tmpvar_42;
  tmpvar_42 = max (0.0, dot (tmpvar_2, viewDir_38));
  float tmpvar_43;
  tmpvar_43 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_40));
  float tmpvar_44;
  tmpvar_44 = ((tmpvar_39 * tmpvar_39) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_45;
  float tmpvar_46;
  tmpvar_46 = (10.0 / log2((
    ((1.0 - tmpvar_39) * 0.968)
   + 0.03)));
  tmpvar_45 = (tmpvar_46 * tmpvar_46);
  float x_47;
  x_47 = (1.0 - tmpvar_9);
  float x_48;
  x_48 = (1.0 - tmpvar_42);
  float tmpvar_49;
  tmpvar_49 = (0.5 + ((2.0 * tmpvar_43) * (tmpvar_43 * tmpvar_39)));
  float x_50;
  x_50 = (1.0 - tmpvar_43);
  float x_51;
  x_51 = (1.0 - tmpvar_42);
  vec3 tmpvar_52;
  tmpvar_52 = (((tmpvar_5 * 
    (tmpvar_10 + (_LightColor0.xyz * ((
      (1.0 + ((tmpvar_49 - 1.0) * ((x_47 * x_47) * (
        (x_47 * x_47)
       * x_47))))
     * 
      (1.0 + ((tmpvar_49 - 1.0) * ((x_48 * x_48) * (
        (x_48 * x_48)
       * x_48))))
    ) * tmpvar_9)))
  ) + (
    (max (0.0, ((
      ((1.0/(((
        ((tmpvar_9 * (1.0 - tmpvar_44)) + tmpvar_44)
       * 
        ((tmpvar_42 * (1.0 - tmpvar_44)) + tmpvar_44)
      ) + 0.0001))) * (pow (max (0.0, 
        dot (tmpvar_2, tmpvar_40)
      ), tmpvar_45) * ((tmpvar_45 + 1.0) * unity_LightGammaCorrectionConsts.y)))
     * tmpvar_9) * unity_LightGammaCorrectionConsts.x)) * _LightColor0.xyz)
   * 
    (tmpvar_7 + ((1.0 - tmpvar_7) * ((x_50 * x_50) * (
      (x_50 * x_50)
     * x_50))))
  )) + (tmpvar_11 * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_6)), 0.0, 1.0)
  ), vec3(
    ((x_51 * x_51) * ((x_51 * x_51) * x_51))
  ))));
  vec4 tmpvar_53;
  tmpvar_53.w = 1.0;
  tmpvar_53.xyz = tmpvar_52;
  c_1.w = tmpvar_53.w;
  c_1.xyz = tmpvar_52;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_54;
  xlat_varoutput_54.xyz = c_1.xyz;
  xlat_varoutput_54.w = 1.0;
  gl_FragData[0] = xlat_varoutput_54;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 158 math, 5 textures, 9 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec3 tmpvar_8;
  vec4 tmpvar_9;
  tmpvar_9 = (_Object2World * gl_Vertex);
  tmpvar_8 = tmpvar_9.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec4 o_16;
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_3 * 0.5);
  vec2 tmpvar_18;
  tmpvar_18.x = tmpvar_17.x;
  tmpvar_18.y = (tmpvar_17.y * _ProjectionParams.x);
  o_16.xy = (tmpvar_18 + tmpvar_17.w);
  o_16.zw = tmpvar_3.zw;
  vec3 x2_19;
  vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x2_19.x = dot (unity_SHBr, tmpvar_20);
  x2_19.y = dot (unity_SHBg, tmpvar_20);
  x2_19.z = dot (unity_SHBb, tmpvar_20);
  tmpvar_7.xyz = (x2_19 + (unity_SHC.xyz * (
    (tmpvar_15.x * tmpvar_15.x)
   - 
    (tmpvar_15.y * tmpvar_15.y)
  )));
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = o_16;
  xlv_TEXCOORD8 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_5;
  float oneMinusReflectivity_6;
  vec3 tmpvar_7;
  tmpvar_7 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, vec3(_Metallic));
  oneMinusReflectivity_6 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * oneMinusReflectivity_6);
  float tmpvar_8;
  tmpvar_8 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  float tmpvar_9;
  tmpvar_9 = max (0.0, dot (tmpvar_2, _WorldSpaceLightPos0.xyz));
  vec3 tmpvar_10;
  vec3 tmpvar_11;
  vec3 tmpvar_12;
  tmpvar_12 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_2;
  vec3 x1_14;
  x1_14.x = dot (unity_SHAr, tmpvar_13);
  x1_14.y = dot (unity_SHAg, tmpvar_13);
  x1_14.z = dot (unity_SHAb, tmpvar_13);
  tmpvar_11 = (xlv_TEXCOORD5.xyz + x1_14);
  tmpvar_10 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x);
  tmpvar_11 = (tmpvar_11 * tmpvar_8);
  vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_3 - (2.0 * (
    dot (tmpvar_2, tmpvar_3)
   * tmpvar_2)));
  vec3 worldNormal_16;
  worldNormal_16 = tmpvar_15;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_17;
    tmpvar_17 = normalize(tmpvar_15);
    vec3 tmpvar_18;
    tmpvar_18 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_17);
    vec3 tmpvar_19;
    tmpvar_19 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_17);
    bvec3 tmpvar_20;
    tmpvar_20 = greaterThan (tmpvar_17, vec3(0.0, 0.0, 0.0));
    float tmpvar_21;
    if (tmpvar_20.x) {
      tmpvar_21 = tmpvar_18.x;
    } else {
      tmpvar_21 = tmpvar_19.x;
    };
    float tmpvar_22;
    if (tmpvar_20.y) {
      tmpvar_22 = tmpvar_18.y;
    } else {
      tmpvar_22 = tmpvar_19.y;
    };
    float tmpvar_23;
    if (tmpvar_20.z) {
      tmpvar_23 = tmpvar_18.z;
    } else {
      tmpvar_23 = tmpvar_19.z;
    };
    vec3 tmpvar_24;
    tmpvar_24 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_16 = (((
      (tmpvar_24 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD8) + (tmpvar_17 * 
      min (min (tmpvar_21, tmpvar_22), tmpvar_23)
    )) - tmpvar_24);
  };
  vec4 tmpvar_25;
  tmpvar_25.xyz = worldNormal_16;
  tmpvar_25.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_26;
  tmpvar_26 = textureCubeLod (unity_SpecCube0, worldNormal_16, tmpvar_25.w);
  vec3 tmpvar_27;
  tmpvar_27 = ((unity_SpecCube0_HDR.x * pow (tmpvar_26.w, unity_SpecCube0_HDR.y)) * tmpvar_26.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_28;
    worldNormal_28 = tmpvar_15;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_29;
      tmpvar_29 = normalize(tmpvar_15);
      vec3 tmpvar_30;
      tmpvar_30 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_29);
      vec3 tmpvar_31;
      tmpvar_31 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_29);
      bvec3 tmpvar_32;
      tmpvar_32 = greaterThan (tmpvar_29, vec3(0.0, 0.0, 0.0));
      float tmpvar_33;
      if (tmpvar_32.x) {
        tmpvar_33 = tmpvar_30.x;
      } else {
        tmpvar_33 = tmpvar_31.x;
      };
      float tmpvar_34;
      if (tmpvar_32.y) {
        tmpvar_34 = tmpvar_30.y;
      } else {
        tmpvar_34 = tmpvar_31.y;
      };
      float tmpvar_35;
      if (tmpvar_32.z) {
        tmpvar_35 = tmpvar_30.z;
      } else {
        tmpvar_35 = tmpvar_31.z;
      };
      vec3 tmpvar_36;
      tmpvar_36 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_28 = (((
        (tmpvar_36 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD8) + (tmpvar_29 * 
        min (min (tmpvar_33, tmpvar_34), tmpvar_35)
      )) - tmpvar_36);
    };
    vec4 tmpvar_37;
    tmpvar_37.xyz = worldNormal_28;
    tmpvar_37.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_38;
    tmpvar_38 = textureCubeLod (unity_SpecCube1, worldNormal_28, tmpvar_37.w);
    tmpvar_12 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_38.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_38.xyz), tmpvar_27, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_12 = tmpvar_27;
  };
  tmpvar_12 = (tmpvar_12 * tmpvar_8);
  vec3 viewDir_39;
  viewDir_39 = -(tmpvar_3);
  float tmpvar_40;
  tmpvar_40 = (1.0 - _Glossiness);
  vec3 tmpvar_41;
  vec3 inVec_42;
  inVec_42 = (_WorldSpaceLightPos0.xyz + viewDir_39);
  tmpvar_41 = (inVec_42 * inversesqrt(max (0.001, 
    dot (inVec_42, inVec_42)
  )));
  float tmpvar_43;
  tmpvar_43 = max (0.0, dot (tmpvar_2, viewDir_39));
  float tmpvar_44;
  tmpvar_44 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_41));
  float tmpvar_45;
  tmpvar_45 = ((tmpvar_40 * tmpvar_40) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_46;
  float tmpvar_47;
  tmpvar_47 = (10.0 / log2((
    ((1.0 - tmpvar_40) * 0.968)
   + 0.03)));
  tmpvar_46 = (tmpvar_47 * tmpvar_47);
  float x_48;
  x_48 = (1.0 - tmpvar_9);
  float x_49;
  x_49 = (1.0 - tmpvar_43);
  float tmpvar_50;
  tmpvar_50 = (0.5 + ((2.0 * tmpvar_44) * (tmpvar_44 * tmpvar_40)));
  float x_51;
  x_51 = (1.0 - tmpvar_44);
  float x_52;
  x_52 = (1.0 - tmpvar_43);
  vec3 tmpvar_53;
  tmpvar_53 = (((tmpvar_5 * 
    (tmpvar_11 + (tmpvar_10 * ((
      (1.0 + ((tmpvar_50 - 1.0) * ((x_48 * x_48) * (
        (x_48 * x_48)
       * x_48))))
     * 
      (1.0 + ((tmpvar_50 - 1.0) * ((x_49 * x_49) * (
        (x_49 * x_49)
       * x_49))))
    ) * tmpvar_9)))
  ) + (
    (max (0.0, ((
      ((1.0/(((
        ((tmpvar_9 * (1.0 - tmpvar_45)) + tmpvar_45)
       * 
        ((tmpvar_43 * (1.0 - tmpvar_45)) + tmpvar_45)
      ) + 0.0001))) * (pow (max (0.0, 
        dot (tmpvar_2, tmpvar_41)
      ), tmpvar_46) * ((tmpvar_46 + 1.0) * unity_LightGammaCorrectionConsts.y)))
     * tmpvar_9) * unity_LightGammaCorrectionConsts.x)) * tmpvar_10)
   * 
    (tmpvar_7 + ((1.0 - tmpvar_7) * ((x_51 * x_51) * (
      (x_51 * x_51)
     * x_51))))
  )) + (tmpvar_12 * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_6)), 0.0, 1.0)
  ), vec3(
    ((x_52 * x_52) * ((x_52 * x_52) * x_52))
  ))));
  vec4 tmpvar_54;
  tmpvar_54.w = 1.0;
  tmpvar_54.xyz = tmpvar_53;
  c_1.w = tmpvar_54.w;
  c_1.xyz = tmpvar_53;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_55;
  xlat_varoutput_55.xyz = c_1.xyz;
  xlat_varoutput_55.w = 1.0;
  gl_FragData[0] = xlat_varoutput_55;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 157 math, 4 textures, 9 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec3 tmpvar_8;
  vec4 tmpvar_9;
  tmpvar_9 = (_Object2World * gl_Vertex);
  tmpvar_8 = tmpvar_9.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec3 x2_16;
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x2_16.x = dot (unity_SHBr, tmpvar_17);
  x2_16.y = dot (unity_SHBg, tmpvar_17);
  x2_16.z = dot (unity_SHBb, tmpvar_17);
  tmpvar_7.xyz = (x2_16 + (unity_SHC.xyz * (
    (tmpvar_15.x * tmpvar_15.x)
   - 
    (tmpvar_15.y * tmpvar_15.y)
  )));
  vec3 col_18;
  vec4 ndotl_19;
  vec4 lengthSq_20;
  vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosX0 - tmpvar_9.x);
  vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosY0 - tmpvar_9.y);
  vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_20 = (tmpvar_21 * tmpvar_21);
  lengthSq_20 = (lengthSq_20 + (tmpvar_22 * tmpvar_22));
  lengthSq_20 = (lengthSq_20 + (tmpvar_23 * tmpvar_23));
  ndotl_19 = (tmpvar_21 * tmpvar_15.x);
  ndotl_19 = (ndotl_19 + (tmpvar_22 * tmpvar_15.y));
  ndotl_19 = (ndotl_19 + (tmpvar_23 * tmpvar_15.z));
  vec4 tmpvar_24;
  tmpvar_24 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_19 * inversesqrt(lengthSq_20)));
  ndotl_19 = tmpvar_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_24 * (1.0/((1.0 + 
    (lengthSq_20 * unity_4LightAtten0)
  ))));
  col_18 = (unity_LightColor[0].xyz * tmpvar_25.x);
  col_18 = (col_18 + (unity_LightColor[1].xyz * tmpvar_25.y));
  col_18 = (col_18 + (unity_LightColor[2].xyz * tmpvar_25.z));
  col_18 = (col_18 + (unity_LightColor[3].xyz * tmpvar_25.w));
  tmpvar_7.xyz = (tmpvar_7.xyz + col_18);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD8 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_5;
  float oneMinusReflectivity_6;
  vec3 tmpvar_7;
  tmpvar_7 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, vec3(_Metallic));
  oneMinusReflectivity_6 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * oneMinusReflectivity_6);
  float tmpvar_8;
  tmpvar_8 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  float tmpvar_9;
  tmpvar_9 = max (0.0, dot (tmpvar_2, _WorldSpaceLightPos0.xyz));
  vec3 tmpvar_10;
  vec3 tmpvar_11;
  tmpvar_11 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_2;
  vec3 x1_13;
  x1_13.x = dot (unity_SHAr, tmpvar_12);
  x1_13.y = dot (unity_SHAg, tmpvar_12);
  x1_13.z = dot (unity_SHAb, tmpvar_12);
  tmpvar_10 = (xlv_TEXCOORD5.xyz + x1_13);
  tmpvar_10 = (tmpvar_10 * tmpvar_8);
  vec3 tmpvar_14;
  tmpvar_14 = (tmpvar_3 - (2.0 * (
    dot (tmpvar_2, tmpvar_3)
   * tmpvar_2)));
  vec3 worldNormal_15;
  worldNormal_15 = tmpvar_14;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_16;
    tmpvar_16 = normalize(tmpvar_14);
    vec3 tmpvar_17;
    tmpvar_17 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_16);
    vec3 tmpvar_18;
    tmpvar_18 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_16);
    bvec3 tmpvar_19;
    tmpvar_19 = greaterThan (tmpvar_16, vec3(0.0, 0.0, 0.0));
    float tmpvar_20;
    if (tmpvar_19.x) {
      tmpvar_20 = tmpvar_17.x;
    } else {
      tmpvar_20 = tmpvar_18.x;
    };
    float tmpvar_21;
    if (tmpvar_19.y) {
      tmpvar_21 = tmpvar_17.y;
    } else {
      tmpvar_21 = tmpvar_18.y;
    };
    float tmpvar_22;
    if (tmpvar_19.z) {
      tmpvar_22 = tmpvar_17.z;
    } else {
      tmpvar_22 = tmpvar_18.z;
    };
    vec3 tmpvar_23;
    tmpvar_23 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_15 = (((
      (tmpvar_23 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD8) + (tmpvar_16 * 
      min (min (tmpvar_20, tmpvar_21), tmpvar_22)
    )) - tmpvar_23);
  };
  vec4 tmpvar_24;
  tmpvar_24.xyz = worldNormal_15;
  tmpvar_24.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_25;
  tmpvar_25 = textureCubeLod (unity_SpecCube0, worldNormal_15, tmpvar_24.w);
  vec3 tmpvar_26;
  tmpvar_26 = ((unity_SpecCube0_HDR.x * pow (tmpvar_25.w, unity_SpecCube0_HDR.y)) * tmpvar_25.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_27;
    worldNormal_27 = tmpvar_14;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_28;
      tmpvar_28 = normalize(tmpvar_14);
      vec3 tmpvar_29;
      tmpvar_29 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_28);
      vec3 tmpvar_30;
      tmpvar_30 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_28);
      bvec3 tmpvar_31;
      tmpvar_31 = greaterThan (tmpvar_28, vec3(0.0, 0.0, 0.0));
      float tmpvar_32;
      if (tmpvar_31.x) {
        tmpvar_32 = tmpvar_29.x;
      } else {
        tmpvar_32 = tmpvar_30.x;
      };
      float tmpvar_33;
      if (tmpvar_31.y) {
        tmpvar_33 = tmpvar_29.y;
      } else {
        tmpvar_33 = tmpvar_30.y;
      };
      float tmpvar_34;
      if (tmpvar_31.z) {
        tmpvar_34 = tmpvar_29.z;
      } else {
        tmpvar_34 = tmpvar_30.z;
      };
      vec3 tmpvar_35;
      tmpvar_35 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_27 = (((
        (tmpvar_35 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD8) + (tmpvar_28 * 
        min (min (tmpvar_32, tmpvar_33), tmpvar_34)
      )) - tmpvar_35);
    };
    vec4 tmpvar_36;
    tmpvar_36.xyz = worldNormal_27;
    tmpvar_36.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_37;
    tmpvar_37 = textureCubeLod (unity_SpecCube1, worldNormal_27, tmpvar_36.w);
    tmpvar_11 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_37.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_37.xyz), tmpvar_26, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_11 = tmpvar_26;
  };
  tmpvar_11 = (tmpvar_11 * tmpvar_8);
  vec3 viewDir_38;
  viewDir_38 = -(tmpvar_3);
  float tmpvar_39;
  tmpvar_39 = (1.0 - _Glossiness);
  vec3 tmpvar_40;
  vec3 inVec_41;
  inVec_41 = (_WorldSpaceLightPos0.xyz + viewDir_38);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  float tmpvar_42;
  tmpvar_42 = max (0.0, dot (tmpvar_2, viewDir_38));
  float tmpvar_43;
  tmpvar_43 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_40));
  float tmpvar_44;
  tmpvar_44 = ((tmpvar_39 * tmpvar_39) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_45;
  float tmpvar_46;
  tmpvar_46 = (10.0 / log2((
    ((1.0 - tmpvar_39) * 0.968)
   + 0.03)));
  tmpvar_45 = (tmpvar_46 * tmpvar_46);
  float x_47;
  x_47 = (1.0 - tmpvar_9);
  float x_48;
  x_48 = (1.0 - tmpvar_42);
  float tmpvar_49;
  tmpvar_49 = (0.5 + ((2.0 * tmpvar_43) * (tmpvar_43 * tmpvar_39)));
  float x_50;
  x_50 = (1.0 - tmpvar_43);
  float x_51;
  x_51 = (1.0 - tmpvar_42);
  vec3 tmpvar_52;
  tmpvar_52 = (((tmpvar_5 * 
    (tmpvar_10 + (_LightColor0.xyz * ((
      (1.0 + ((tmpvar_49 - 1.0) * ((x_47 * x_47) * (
        (x_47 * x_47)
       * x_47))))
     * 
      (1.0 + ((tmpvar_49 - 1.0) * ((x_48 * x_48) * (
        (x_48 * x_48)
       * x_48))))
    ) * tmpvar_9)))
  ) + (
    (max (0.0, ((
      ((1.0/(((
        ((tmpvar_9 * (1.0 - tmpvar_44)) + tmpvar_44)
       * 
        ((tmpvar_42 * (1.0 - tmpvar_44)) + tmpvar_44)
      ) + 0.0001))) * (pow (max (0.0, 
        dot (tmpvar_2, tmpvar_40)
      ), tmpvar_45) * ((tmpvar_45 + 1.0) * unity_LightGammaCorrectionConsts.y)))
     * tmpvar_9) * unity_LightGammaCorrectionConsts.x)) * _LightColor0.xyz)
   * 
    (tmpvar_7 + ((1.0 - tmpvar_7) * ((x_50 * x_50) * (
      (x_50 * x_50)
     * x_50))))
  )) + (tmpvar_11 * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_6)), 0.0, 1.0)
  ), vec3(
    ((x_51 * x_51) * ((x_51 * x_51) * x_51))
  ))));
  vec4 tmpvar_53;
  tmpvar_53.w = 1.0;
  tmpvar_53.xyz = tmpvar_52;
  c_1.w = tmpvar_53.w;
  c_1.xyz = tmpvar_52;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_54;
  xlat_varoutput_54.xyz = c_1.xyz;
  xlat_varoutput_54.w = 1.0;
  gl_FragData[0] = xlat_varoutput_54;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 158 math, 5 textures, 9 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec3 tmpvar_8;
  vec4 tmpvar_9;
  tmpvar_9 = (_Object2World * gl_Vertex);
  tmpvar_8 = tmpvar_9.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec4 o_16;
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_3 * 0.5);
  vec2 tmpvar_18;
  tmpvar_18.x = tmpvar_17.x;
  tmpvar_18.y = (tmpvar_17.y * _ProjectionParams.x);
  o_16.xy = (tmpvar_18 + tmpvar_17.w);
  o_16.zw = tmpvar_3.zw;
  vec3 x2_19;
  vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x2_19.x = dot (unity_SHBr, tmpvar_20);
  x2_19.y = dot (unity_SHBg, tmpvar_20);
  x2_19.z = dot (unity_SHBb, tmpvar_20);
  tmpvar_7.xyz = (x2_19 + (unity_SHC.xyz * (
    (tmpvar_15.x * tmpvar_15.x)
   - 
    (tmpvar_15.y * tmpvar_15.y)
  )));
  vec3 col_21;
  vec4 ndotl_22;
  vec4 lengthSq_23;
  vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_9.x);
  vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_9.y);
  vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  ndotl_22 = (tmpvar_24 * tmpvar_15.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_15.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_15.z));
  vec4 tmpvar_27;
  tmpvar_27 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(lengthSq_23)));
  ndotl_22 = tmpvar_27;
  vec4 tmpvar_28;
  tmpvar_28 = (tmpvar_27 * (1.0/((1.0 + 
    (lengthSq_23 * unity_4LightAtten0)
  ))));
  col_21 = (unity_LightColor[0].xyz * tmpvar_28.x);
  col_21 = (col_21 + (unity_LightColor[1].xyz * tmpvar_28.y));
  col_21 = (col_21 + (unity_LightColor[2].xyz * tmpvar_28.z));
  col_21 = (col_21 + (unity_LightColor[3].xyz * tmpvar_28.w));
  tmpvar_7.xyz = (tmpvar_7.xyz + col_21);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = (tmpvar_9.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = o_16;
  xlv_TEXCOORD8 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_4;
  tmpvar_4 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_5;
  float oneMinusReflectivity_6;
  vec3 tmpvar_7;
  tmpvar_7 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, vec3(_Metallic));
  oneMinusReflectivity_6 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * oneMinusReflectivity_6);
  float tmpvar_8;
  tmpvar_8 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  float tmpvar_9;
  tmpvar_9 = max (0.0, dot (tmpvar_2, _WorldSpaceLightPos0.xyz));
  vec3 tmpvar_10;
  vec3 tmpvar_11;
  vec3 tmpvar_12;
  tmpvar_12 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_2;
  vec3 x1_14;
  x1_14.x = dot (unity_SHAr, tmpvar_13);
  x1_14.y = dot (unity_SHAg, tmpvar_13);
  x1_14.z = dot (unity_SHAb, tmpvar_13);
  tmpvar_11 = (xlv_TEXCOORD5.xyz + x1_14);
  tmpvar_10 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x);
  tmpvar_11 = (tmpvar_11 * tmpvar_8);
  vec3 tmpvar_15;
  tmpvar_15 = (tmpvar_3 - (2.0 * (
    dot (tmpvar_2, tmpvar_3)
   * tmpvar_2)));
  vec3 worldNormal_16;
  worldNormal_16 = tmpvar_15;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_17;
    tmpvar_17 = normalize(tmpvar_15);
    vec3 tmpvar_18;
    tmpvar_18 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_17);
    vec3 tmpvar_19;
    tmpvar_19 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_17);
    bvec3 tmpvar_20;
    tmpvar_20 = greaterThan (tmpvar_17, vec3(0.0, 0.0, 0.0));
    float tmpvar_21;
    if (tmpvar_20.x) {
      tmpvar_21 = tmpvar_18.x;
    } else {
      tmpvar_21 = tmpvar_19.x;
    };
    float tmpvar_22;
    if (tmpvar_20.y) {
      tmpvar_22 = tmpvar_18.y;
    } else {
      tmpvar_22 = tmpvar_19.y;
    };
    float tmpvar_23;
    if (tmpvar_20.z) {
      tmpvar_23 = tmpvar_18.z;
    } else {
      tmpvar_23 = tmpvar_19.z;
    };
    vec3 tmpvar_24;
    tmpvar_24 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_16 = (((
      (tmpvar_24 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD8) + (tmpvar_17 * 
      min (min (tmpvar_21, tmpvar_22), tmpvar_23)
    )) - tmpvar_24);
  };
  vec4 tmpvar_25;
  tmpvar_25.xyz = worldNormal_16;
  tmpvar_25.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_26;
  tmpvar_26 = textureCubeLod (unity_SpecCube0, worldNormal_16, tmpvar_25.w);
  vec3 tmpvar_27;
  tmpvar_27 = ((unity_SpecCube0_HDR.x * pow (tmpvar_26.w, unity_SpecCube0_HDR.y)) * tmpvar_26.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_28;
    worldNormal_28 = tmpvar_15;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_29;
      tmpvar_29 = normalize(tmpvar_15);
      vec3 tmpvar_30;
      tmpvar_30 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_29);
      vec3 tmpvar_31;
      tmpvar_31 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_29);
      bvec3 tmpvar_32;
      tmpvar_32 = greaterThan (tmpvar_29, vec3(0.0, 0.0, 0.0));
      float tmpvar_33;
      if (tmpvar_32.x) {
        tmpvar_33 = tmpvar_30.x;
      } else {
        tmpvar_33 = tmpvar_31.x;
      };
      float tmpvar_34;
      if (tmpvar_32.y) {
        tmpvar_34 = tmpvar_30.y;
      } else {
        tmpvar_34 = tmpvar_31.y;
      };
      float tmpvar_35;
      if (tmpvar_32.z) {
        tmpvar_35 = tmpvar_30.z;
      } else {
        tmpvar_35 = tmpvar_31.z;
      };
      vec3 tmpvar_36;
      tmpvar_36 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_28 = (((
        (tmpvar_36 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD8) + (tmpvar_29 * 
        min (min (tmpvar_33, tmpvar_34), tmpvar_35)
      )) - tmpvar_36);
    };
    vec4 tmpvar_37;
    tmpvar_37.xyz = worldNormal_28;
    tmpvar_37.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_38;
    tmpvar_38 = textureCubeLod (unity_SpecCube1, worldNormal_28, tmpvar_37.w);
    tmpvar_12 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_38.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_38.xyz), tmpvar_27, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_12 = tmpvar_27;
  };
  tmpvar_12 = (tmpvar_12 * tmpvar_8);
  vec3 viewDir_39;
  viewDir_39 = -(tmpvar_3);
  float tmpvar_40;
  tmpvar_40 = (1.0 - _Glossiness);
  vec3 tmpvar_41;
  vec3 inVec_42;
  inVec_42 = (_WorldSpaceLightPos0.xyz + viewDir_39);
  tmpvar_41 = (inVec_42 * inversesqrt(max (0.001, 
    dot (inVec_42, inVec_42)
  )));
  float tmpvar_43;
  tmpvar_43 = max (0.0, dot (tmpvar_2, viewDir_39));
  float tmpvar_44;
  tmpvar_44 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_41));
  float tmpvar_45;
  tmpvar_45 = ((tmpvar_40 * tmpvar_40) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_46;
  float tmpvar_47;
  tmpvar_47 = (10.0 / log2((
    ((1.0 - tmpvar_40) * 0.968)
   + 0.03)));
  tmpvar_46 = (tmpvar_47 * tmpvar_47);
  float x_48;
  x_48 = (1.0 - tmpvar_9);
  float x_49;
  x_49 = (1.0 - tmpvar_43);
  float tmpvar_50;
  tmpvar_50 = (0.5 + ((2.0 * tmpvar_44) * (tmpvar_44 * tmpvar_40)));
  float x_51;
  x_51 = (1.0 - tmpvar_44);
  float x_52;
  x_52 = (1.0 - tmpvar_43);
  vec3 tmpvar_53;
  tmpvar_53 = (((tmpvar_5 * 
    (tmpvar_11 + (tmpvar_10 * ((
      (1.0 + ((tmpvar_50 - 1.0) * ((x_48 * x_48) * (
        (x_48 * x_48)
       * x_48))))
     * 
      (1.0 + ((tmpvar_50 - 1.0) * ((x_49 * x_49) * (
        (x_49 * x_49)
       * x_49))))
    ) * tmpvar_9)))
  ) + (
    (max (0.0, ((
      ((1.0/(((
        ((tmpvar_9 * (1.0 - tmpvar_45)) + tmpvar_45)
       * 
        ((tmpvar_43 * (1.0 - tmpvar_45)) + tmpvar_45)
      ) + 0.0001))) * (pow (max (0.0, 
        dot (tmpvar_2, tmpvar_41)
      ), tmpvar_46) * ((tmpvar_46 + 1.0) * unity_LightGammaCorrectionConsts.y)))
     * tmpvar_9) * unity_LightGammaCorrectionConsts.x)) * tmpvar_10)
   * 
    (tmpvar_7 + ((1.0 - tmpvar_7) * ((x_51 * x_51) * (
      (x_51 * x_51)
     * x_51))))
  )) + (tmpvar_12 * mix (tmpvar_7, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_6)), 0.0, 1.0)
  ), vec3(
    ((x_52 * x_52) * ((x_52 * x_52) * x_52))
  ))));
  vec4 tmpvar_54;
  tmpvar_54.w = 1.0;
  tmpvar_54.xyz = tmpvar_53;
  c_1.w = tmpvar_54.w;
  c_1.xyz = tmpvar_53;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_55;
  xlat_varoutput_55.xyz = c_1.xyz;
  xlat_varoutput_55.w = 1.0;
  gl_FragData[0] = xlat_varoutput_55;
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
}
 }


 // Stats for Vertex shader:
 //      opengl : 92 avg math (84..103), 3 avg texture (1..7), 0 avg branch (0..4)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend [_SrcBlend] One
  GpuProgramID 115835
Program "vp" {
SubProgram "opengl " {
// Stats: 87 math, 2 textures
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_5;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(tmpvar_4);
  float tmpvar_7;
  tmpvar_7 = max (0.0, dot (tmpvar_1, tmpvar_6));
  tmpvar_5 = (_LightColor0.xyz * texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5))).w);
  vec3 viewDir_8;
  viewDir_8 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  vec3 inVec_11;
  inVec_11 = (tmpvar_6 + viewDir_8);
  tmpvar_10 = (inVec_11 * inversesqrt(max (0.001, 
    dot (inVec_11, inVec_11)
  )));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_1, viewDir_8));
  float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_6, tmpvar_10));
  float tmpvar_14;
  tmpvar_14 = ((tmpvar_9 * tmpvar_9) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_15;
  float tmpvar_16;
  tmpvar_16 = (10.0 / log2((
    ((1.0 - tmpvar_9) * 0.968)
   + 0.03)));
  tmpvar_15 = (tmpvar_16 * tmpvar_16);
  float x_17;
  x_17 = (1.0 - tmpvar_7);
  float x_18;
  x_18 = (1.0 - tmpvar_12);
  float tmpvar_19;
  tmpvar_19 = (0.5 + ((2.0 * tmpvar_13) * (tmpvar_13 * tmpvar_9)));
  float x_20;
  x_20 = (1.0 - tmpvar_13);
  vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_5 * 
    (((1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((x_17 * x_17) * ((x_17 * x_17) * x_17))
    )) * (1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((x_18 * x_18) * ((x_18 * x_18) * x_18))
    ))) * tmpvar_7)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_7 * (1.0 - tmpvar_14))
       + tmpvar_14) * (
        (tmpvar_12 * (1.0 - tmpvar_14))
       + tmpvar_14)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_10)), tmpvar_15) * ((tmpvar_15 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_7) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_5) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_20 * x_20) * ((x_20 * x_20) * x_20)))
  )));
  vec4 xlat_varoutput_22;
  xlat_varoutput_22.xyz = tmpvar_21.xyz;
  xlat_varoutput_22.w = 1.0;
  gl_FragData[0] = xlat_varoutput_22;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 84 math, 1 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  float tmpvar_5;
  tmpvar_5 = max (0.0, dot (tmpvar_1, tmpvar_4));
  vec3 viewDir_6;
  viewDir_6 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_7;
  tmpvar_7 = (1.0 - _Glossiness);
  vec3 tmpvar_8;
  vec3 inVec_9;
  inVec_9 = (tmpvar_4 + viewDir_6);
  tmpvar_8 = (inVec_9 * inversesqrt(max (0.001, 
    dot (inVec_9, inVec_9)
  )));
  float tmpvar_10;
  tmpvar_10 = max (0.0, dot (tmpvar_1, viewDir_6));
  float tmpvar_11;
  tmpvar_11 = max (0.0, dot (tmpvar_4, tmpvar_8));
  float tmpvar_12;
  tmpvar_12 = ((tmpvar_7 * tmpvar_7) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_13;
  float tmpvar_14;
  tmpvar_14 = (10.0 / log2((
    ((1.0 - tmpvar_7) * 0.968)
   + 0.03)));
  tmpvar_13 = (tmpvar_14 * tmpvar_14);
  float x_15;
  x_15 = (1.0 - tmpvar_5);
  float x_16;
  x_16 = (1.0 - tmpvar_10);
  float tmpvar_17;
  tmpvar_17 = (0.5 + ((2.0 * tmpvar_11) * (tmpvar_11 * tmpvar_7)));
  float x_18;
  x_18 = (1.0 - tmpvar_11);
  vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (_LightColor0.xyz * 
    (((1.0 + (
      (tmpvar_17 - 1.0)
     * 
      ((x_15 * x_15) * ((x_15 * x_15) * x_15))
    )) * (1.0 + (
      (tmpvar_17 - 1.0)
     * 
      ((x_16 * x_16) * ((x_16 * x_16) * x_16))
    ))) * tmpvar_5)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_5 * (1.0 - tmpvar_12))
       + tmpvar_12) * (
        (tmpvar_10 * (1.0 - tmpvar_12))
       + tmpvar_12)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_8)), tmpvar_13) * ((tmpvar_13 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_5) * unity_LightGammaCorrectionConsts.x))
   * _LightColor0.xyz) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_18 * x_18) * ((x_18 * x_18) * x_18)))
  )));
  vec4 xlat_varoutput_20;
  xlat_varoutput_20.xyz = tmpvar_19.xyz;
  xlat_varoutput_20.w = 1.0;
  gl_FragData[0] = xlat_varoutput_20;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 93 math, 3 textures
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex));
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_5;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(tmpvar_4);
  float tmpvar_7;
  tmpvar_7 = max (0.0, dot (tmpvar_1, tmpvar_6));
  tmpvar_5 = (_LightColor0.xyz * ((
    float((xlv_TEXCOORD5.z > 0.0))
   * texture2D (_LightTexture0, 
    ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)
  ).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz))).w));
  vec3 viewDir_8;
  viewDir_8 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  vec3 inVec_11;
  inVec_11 = (tmpvar_6 + viewDir_8);
  tmpvar_10 = (inVec_11 * inversesqrt(max (0.001, 
    dot (inVec_11, inVec_11)
  )));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_1, viewDir_8));
  float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_6, tmpvar_10));
  float tmpvar_14;
  tmpvar_14 = ((tmpvar_9 * tmpvar_9) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_15;
  float tmpvar_16;
  tmpvar_16 = (10.0 / log2((
    ((1.0 - tmpvar_9) * 0.968)
   + 0.03)));
  tmpvar_15 = (tmpvar_16 * tmpvar_16);
  float x_17;
  x_17 = (1.0 - tmpvar_7);
  float x_18;
  x_18 = (1.0 - tmpvar_12);
  float tmpvar_19;
  tmpvar_19 = (0.5 + ((2.0 * tmpvar_13) * (tmpvar_13 * tmpvar_9)));
  float x_20;
  x_20 = (1.0 - tmpvar_13);
  vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_5 * 
    (((1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((x_17 * x_17) * ((x_17 * x_17) * x_17))
    )) * (1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((x_18 * x_18) * ((x_18 * x_18) * x_18))
    ))) * tmpvar_7)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_7 * (1.0 - tmpvar_14))
       + tmpvar_14) * (
        (tmpvar_12 * (1.0 - tmpvar_14))
       + tmpvar_14)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_10)), tmpvar_15) * ((tmpvar_15 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_7) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_5) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_20 * x_20) * ((x_20 * x_20) * x_20)))
  )));
  vec4 xlat_varoutput_22;
  xlat_varoutput_22.xyz = tmpvar_21.xyz;
  xlat_varoutput_22.w = 1.0;
  gl_FragData[0] = xlat_varoutput_22;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 88 math, 3 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_5;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(tmpvar_4);
  float tmpvar_7;
  tmpvar_7 = max (0.0, dot (tmpvar_1, tmpvar_6));
  tmpvar_5 = (_LightColor0.xyz * (texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5))).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w));
  vec3 viewDir_8;
  viewDir_8 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  vec3 inVec_11;
  inVec_11 = (tmpvar_6 + viewDir_8);
  tmpvar_10 = (inVec_11 * inversesqrt(max (0.001, 
    dot (inVec_11, inVec_11)
  )));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_1, viewDir_8));
  float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_6, tmpvar_10));
  float tmpvar_14;
  tmpvar_14 = ((tmpvar_9 * tmpvar_9) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_15;
  float tmpvar_16;
  tmpvar_16 = (10.0 / log2((
    ((1.0 - tmpvar_9) * 0.968)
   + 0.03)));
  tmpvar_15 = (tmpvar_16 * tmpvar_16);
  float x_17;
  x_17 = (1.0 - tmpvar_7);
  float x_18;
  x_18 = (1.0 - tmpvar_12);
  float tmpvar_19;
  tmpvar_19 = (0.5 + ((2.0 * tmpvar_13) * (tmpvar_13 * tmpvar_9)));
  float x_20;
  x_20 = (1.0 - tmpvar_13);
  vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_5 * 
    (((1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((x_17 * x_17) * ((x_17 * x_17) * x_17))
    )) * (1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((x_18 * x_18) * ((x_18 * x_18) * x_18))
    ))) * tmpvar_7)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_7 * (1.0 - tmpvar_14))
       + tmpvar_14) * (
        (tmpvar_12 * (1.0 - tmpvar_14))
       + tmpvar_14)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_10)), tmpvar_15) * ((tmpvar_15 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_7) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_5) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_20 * x_20) * ((x_20 * x_20) * x_20)))
  )));
  vec4 xlat_varoutput_22;
  xlat_varoutput_22.xyz = tmpvar_21.xyz;
  xlat_varoutput_22.w = 1.0;
  gl_FragData[0] = xlat_varoutput_22;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 85 math, 2 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xy;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_5;
  float tmpvar_6;
  tmpvar_6 = max (0.0, dot (tmpvar_1, tmpvar_4));
  tmpvar_5 = (_LightColor0.xyz * texture2D (_LightTexture0, xlv_TEXCOORD5).w);
  vec3 viewDir_7;
  viewDir_7 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_8;
  tmpvar_8 = (1.0 - _Glossiness);
  vec3 tmpvar_9;
  vec3 inVec_10;
  inVec_10 = (tmpvar_4 + viewDir_7);
  tmpvar_9 = (inVec_10 * inversesqrt(max (0.001, 
    dot (inVec_10, inVec_10)
  )));
  float tmpvar_11;
  tmpvar_11 = max (0.0, dot (tmpvar_1, viewDir_7));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_4, tmpvar_9));
  float tmpvar_13;
  tmpvar_13 = ((tmpvar_8 * tmpvar_8) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_14;
  float tmpvar_15;
  tmpvar_15 = (10.0 / log2((
    ((1.0 - tmpvar_8) * 0.968)
   + 0.03)));
  tmpvar_14 = (tmpvar_15 * tmpvar_15);
  float x_16;
  x_16 = (1.0 - tmpvar_6);
  float x_17;
  x_17 = (1.0 - tmpvar_11);
  float tmpvar_18;
  tmpvar_18 = (0.5 + ((2.0 * tmpvar_12) * (tmpvar_12 * tmpvar_8)));
  float x_19;
  x_19 = (1.0 - tmpvar_12);
  vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_5 * 
    (((1.0 + (
      (tmpvar_18 - 1.0)
     * 
      ((x_16 * x_16) * ((x_16 * x_16) * x_16))
    )) * (1.0 + (
      (tmpvar_18 - 1.0)
     * 
      ((x_17 * x_17) * ((x_17 * x_17) * x_17))
    ))) * tmpvar_6)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_6 * (1.0 - tmpvar_13))
       + tmpvar_13) * (
        (tmpvar_11 * (1.0 - tmpvar_13))
       + tmpvar_13)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_9)), tmpvar_14) * ((tmpvar_14 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_6) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_5) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_19 * x_19) * ((x_19 * x_19) * x_19)))
  )));
  vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 97 math, 4 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform mat4 unity_World2Shadow[4];

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25);
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * tmpvar_25);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_5;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(tmpvar_4);
  float tmpvar_7;
  tmpvar_7 = max (0.0, dot (tmpvar_1, tmpvar_6));
  tmpvar_5 = (_LightColor0.xyz * ((
    (float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w)
   * texture2D (_LightTextureB0, vec2(
    dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz)
  )).w) * (_LightShadowData.x + 
    (shadow2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x * (1.0 - _LightShadowData.x))
  )));
  vec3 viewDir_8;
  viewDir_8 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  vec3 inVec_11;
  inVec_11 = (tmpvar_6 + viewDir_8);
  tmpvar_10 = (inVec_11 * inversesqrt(max (0.001, 
    dot (inVec_11, inVec_11)
  )));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_1, viewDir_8));
  float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_6, tmpvar_10));
  float tmpvar_14;
  tmpvar_14 = ((tmpvar_9 * tmpvar_9) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_15;
  float tmpvar_16;
  tmpvar_16 = (10.0 / log2((
    ((1.0 - tmpvar_9) * 0.968)
   + 0.03)));
  tmpvar_15 = (tmpvar_16 * tmpvar_16);
  float x_17;
  x_17 = (1.0 - tmpvar_7);
  float x_18;
  x_18 = (1.0 - tmpvar_12);
  float tmpvar_19;
  tmpvar_19 = (0.5 + ((2.0 * tmpvar_13) * (tmpvar_13 * tmpvar_9)));
  float x_20;
  x_20 = (1.0 - tmpvar_13);
  vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_5 * 
    (((1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((x_17 * x_17) * ((x_17 * x_17) * x_17))
    )) * (1.0 + (
      (tmpvar_19 - 1.0)
     * 
      ((x_18 * x_18) * ((x_18 * x_18) * x_18))
    ))) * tmpvar_7)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_7 * (1.0 - tmpvar_14))
       + tmpvar_14) * (
        (tmpvar_12 * (1.0 - tmpvar_14))
       + tmpvar_14)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_10)), tmpvar_15) * ((tmpvar_15 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_7) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_5) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_20 * x_20) * ((x_20 * x_20) * x_20)))
  )));
  vec4 xlat_varoutput_22;
  xlat_varoutput_22.xyz = tmpvar_21.xyz;
  xlat_varoutput_22.w = 1.0;
  gl_FragData[0] = xlat_varoutput_22;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 85 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec4 o_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_3 * 0.5);
  vec2 tmpvar_26;
  tmpvar_26.x = tmpvar_25.x;
  tmpvar_26.y = (tmpvar_25.y * _ProjectionParams.x);
  o_24.xy = (tmpvar_26 + tmpvar_25.w);
  o_24.zw = tmpvar_3.zw;
  vec3 tmpvar_27;
  tmpvar_27 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_27.x;
  tmpvar_5.w = tmpvar_27.y;
  tmpvar_6.w = tmpvar_27.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = o_24;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_5;
  float tmpvar_6;
  tmpvar_6 = max (0.0, dot (tmpvar_1, tmpvar_4));
  tmpvar_5 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x);
  vec3 viewDir_7;
  viewDir_7 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_8;
  tmpvar_8 = (1.0 - _Glossiness);
  vec3 tmpvar_9;
  vec3 inVec_10;
  inVec_10 = (tmpvar_4 + viewDir_7);
  tmpvar_9 = (inVec_10 * inversesqrt(max (0.001, 
    dot (inVec_10, inVec_10)
  )));
  float tmpvar_11;
  tmpvar_11 = max (0.0, dot (tmpvar_1, viewDir_7));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_4, tmpvar_9));
  float tmpvar_13;
  tmpvar_13 = ((tmpvar_8 * tmpvar_8) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_14;
  float tmpvar_15;
  tmpvar_15 = (10.0 / log2((
    ((1.0 - tmpvar_8) * 0.968)
   + 0.03)));
  tmpvar_14 = (tmpvar_15 * tmpvar_15);
  float x_16;
  x_16 = (1.0 - tmpvar_6);
  float x_17;
  x_17 = (1.0 - tmpvar_11);
  float tmpvar_18;
  tmpvar_18 = (0.5 + ((2.0 * tmpvar_12) * (tmpvar_12 * tmpvar_8)));
  float x_19;
  x_19 = (1.0 - tmpvar_12);
  vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_5 * 
    (((1.0 + (
      (tmpvar_18 - 1.0)
     * 
      ((x_16 * x_16) * ((x_16 * x_16) * x_16))
    )) * (1.0 + (
      (tmpvar_18 - 1.0)
     * 
      ((x_17 * x_17) * ((x_17 * x_17) * x_17))
    ))) * tmpvar_6)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_6 * (1.0 - tmpvar_13))
       + tmpvar_13) * (
        (tmpvar_11 * (1.0 - tmpvar_13))
       + tmpvar_13)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_9)), tmpvar_14) * ((tmpvar_14 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_6) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_5) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_19 * x_19) * ((x_19 * x_19) * x_19)))
  )));
  vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 86 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec4 o_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_3 * 0.5);
  vec2 tmpvar_26;
  tmpvar_26.x = tmpvar_25.x;
  tmpvar_26.y = (tmpvar_25.y * _ProjectionParams.x);
  o_24.xy = (tmpvar_26 + tmpvar_25.w);
  o_24.zw = tmpvar_3.zw;
  vec3 tmpvar_27;
  tmpvar_27 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_27.x;
  tmpvar_5.w = tmpvar_27.y;
  tmpvar_6.w = tmpvar_27.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xy;
  xlv_TEXCOORD6 = o_24;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_5;
  float tmpvar_6;
  tmpvar_6 = max (0.0, dot (tmpvar_1, tmpvar_4));
  tmpvar_5 = (_LightColor0.xyz * (texture2D (_LightTexture0, xlv_TEXCOORD5).w * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x));
  vec3 viewDir_7;
  viewDir_7 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_8;
  tmpvar_8 = (1.0 - _Glossiness);
  vec3 tmpvar_9;
  vec3 inVec_10;
  inVec_10 = (tmpvar_4 + viewDir_7);
  tmpvar_9 = (inVec_10 * inversesqrt(max (0.001, 
    dot (inVec_10, inVec_10)
  )));
  float tmpvar_11;
  tmpvar_11 = max (0.0, dot (tmpvar_1, viewDir_7));
  float tmpvar_12;
  tmpvar_12 = max (0.0, dot (tmpvar_4, tmpvar_9));
  float tmpvar_13;
  tmpvar_13 = ((tmpvar_8 * tmpvar_8) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_14;
  float tmpvar_15;
  tmpvar_15 = (10.0 / log2((
    ((1.0 - tmpvar_8) * 0.968)
   + 0.03)));
  tmpvar_14 = (tmpvar_15 * tmpvar_15);
  float x_16;
  x_16 = (1.0 - tmpvar_6);
  float x_17;
  x_17 = (1.0 - tmpvar_11);
  float tmpvar_18;
  tmpvar_18 = (0.5 + ((2.0 * tmpvar_12) * (tmpvar_12 * tmpvar_8)));
  float x_19;
  x_19 = (1.0 - tmpvar_12);
  vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_5 * 
    (((1.0 + (
      (tmpvar_18 - 1.0)
     * 
      ((x_16 * x_16) * ((x_16 * x_16) * x_16))
    )) * (1.0 + (
      (tmpvar_18 - 1.0)
     * 
      ((x_17 * x_17) * ((x_17 * x_17) * x_17))
    ))) * tmpvar_6)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_6 * (1.0 - tmpvar_13))
       + tmpvar_13) * (
        (tmpvar_11 * (1.0 - tmpvar_13))
       + tmpvar_13)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_9)), tmpvar_14) * ((tmpvar_14 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_6) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_5) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_19 * x_19) * ((x_19 * x_19) * x_19)))
  )));
  vec4 xlat_varoutput_21;
  xlat_varoutput_21.xyz = tmpvar_20.xyz;
  xlat_varoutput_21.w = 1.0;
  gl_FragData[0] = xlat_varoutput_21;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 94 math, 3 textures, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  float mydist_8;
  mydist_8 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_9;
  tmpvar_9 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  float tmpvar_10;
  if ((tmpvar_9.x < mydist_8)) {
    tmpvar_10 = _LightShadowData.x;
  } else {
    tmpvar_10 = 1.0;
  };
  vec3 tmpvar_11;
  vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_6);
  float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_1, tmpvar_12));
  tmpvar_11 = (_LightColor0.xyz * (tmpvar_7.w * tmpvar_10));
  vec3 viewDir_14;
  viewDir_14 = -(tmpvar_2);
  float tmpvar_15;
  tmpvar_15 = (1.0 - _Glossiness);
  vec3 tmpvar_16;
  vec3 inVec_17;
  inVec_17 = (tmpvar_12 + viewDir_14);
  tmpvar_16 = (inVec_17 * inversesqrt(max (0.001, 
    dot (inVec_17, inVec_17)
  )));
  float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_1, viewDir_14));
  float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_12, tmpvar_16));
  float tmpvar_20;
  tmpvar_20 = ((tmpvar_15 * tmpvar_15) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_21;
  float tmpvar_22;
  tmpvar_22 = (10.0 / log2((
    ((1.0 - tmpvar_15) * 0.968)
   + 0.03)));
  tmpvar_21 = (tmpvar_22 * tmpvar_22);
  float x_23;
  x_23 = (1.0 - tmpvar_13);
  float x_24;
  x_24 = (1.0 - tmpvar_18);
  float tmpvar_25;
  tmpvar_25 = (0.5 + ((2.0 * tmpvar_19) * (tmpvar_19 * tmpvar_15)));
  float x_26;
  x_26 = (1.0 - tmpvar_19);
  vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = ((tmpvar_4 * (tmpvar_11 * 
    (((1.0 + (
      (tmpvar_25 - 1.0)
     * 
      ((x_23 * x_23) * ((x_23 * x_23) * x_23))
    )) * (1.0 + (
      (tmpvar_25 - 1.0)
     * 
      ((x_24 * x_24) * ((x_24 * x_24) * x_24))
    ))) * tmpvar_13)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_13 * (1.0 - tmpvar_20))
       + tmpvar_20) * (
        (tmpvar_18 * (1.0 - tmpvar_20))
       + tmpvar_20)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_16)), tmpvar_21) * ((tmpvar_21 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_13) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_11) * (tmpvar_5 + 
    ((1.0 - tmpvar_5) * ((x_26 * x_26) * ((x_26 * x_26) * x_26)))
  )));
  vec4 xlat_varoutput_28;
  xlat_varoutput_28.xyz = tmpvar_27.xyz;
  xlat_varoutput_28.w = 1.0;
  gl_FragData[0] = xlat_varoutput_28;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 95 math, 4 textures, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  vec4 tmpvar_8;
  tmpvar_8 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  float mydist_9;
  mydist_9 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_10;
  tmpvar_10 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  float tmpvar_11;
  if ((tmpvar_10.x < mydist_9)) {
    tmpvar_11 = _LightShadowData.x;
  } else {
    tmpvar_11 = 1.0;
  };
  vec3 tmpvar_12;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(tmpvar_6);
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_1, tmpvar_13));
  tmpvar_12 = (_LightColor0.xyz * ((tmpvar_7.w * tmpvar_8.w) * tmpvar_11));
  vec3 viewDir_15;
  viewDir_15 = -(tmpvar_2);
  float tmpvar_16;
  tmpvar_16 = (1.0 - _Glossiness);
  vec3 tmpvar_17;
  vec3 inVec_18;
  inVec_18 = (tmpvar_13 + viewDir_15);
  tmpvar_17 = (inVec_18 * inversesqrt(max (0.001, 
    dot (inVec_18, inVec_18)
  )));
  float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_1, viewDir_15));
  float tmpvar_20;
  tmpvar_20 = max (0.0, dot (tmpvar_13, tmpvar_17));
  float tmpvar_21;
  tmpvar_21 = ((tmpvar_16 * tmpvar_16) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_22;
  float tmpvar_23;
  tmpvar_23 = (10.0 / log2((
    ((1.0 - tmpvar_16) * 0.968)
   + 0.03)));
  tmpvar_22 = (tmpvar_23 * tmpvar_23);
  float x_24;
  x_24 = (1.0 - tmpvar_14);
  float x_25;
  x_25 = (1.0 - tmpvar_19);
  float tmpvar_26;
  tmpvar_26 = (0.5 + ((2.0 * tmpvar_20) * (tmpvar_20 * tmpvar_16)));
  float x_27;
  x_27 = (1.0 - tmpvar_20);
  vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((tmpvar_4 * (tmpvar_12 * 
    (((1.0 + (
      (tmpvar_26 - 1.0)
     * 
      ((x_24 * x_24) * ((x_24 * x_24) * x_24))
    )) * (1.0 + (
      (tmpvar_26 - 1.0)
     * 
      ((x_25 * x_25) * ((x_25 * x_25) * x_25))
    ))) * tmpvar_14)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_14 * (1.0 - tmpvar_21))
       + tmpvar_21) * (
        (tmpvar_19 * (1.0 - tmpvar_21))
       + tmpvar_21)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_17)), tmpvar_22) * ((tmpvar_22 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_14) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_12) * (tmpvar_5 + 
    ((1.0 - tmpvar_5) * ((x_27 * x_27) * ((x_27 * x_27) * x_27)))
  )));
  vec4 xlat_varoutput_29;
  xlat_varoutput_29.xyz = tmpvar_28.xyz;
  xlat_varoutput_29.w = 1.0;
  gl_FragData[0] = xlat_varoutput_29;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 103 math, 7 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform mat4 unity_World2Shadow[4];

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25);
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * tmpvar_25);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2DShadow _ShadowMapTexture;
uniform vec4 _ShadowOffsets[4];
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  vec3 tmpvar_4;
  tmpvar_4.x = xlv_TEXCOORD2.w;
  tmpvar_4.y = xlv_TEXCOORD2_1.w;
  tmpvar_4.z = xlv_TEXCOORD2_2.w;
  vec4 shadows_5;
  vec3 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  shadows_5.x = shadow2D (_ShadowMapTexture, (tmpvar_6 + _ShadowOffsets[0].xyz)).x;
  shadows_5.y = shadow2D (_ShadowMapTexture, (tmpvar_6 + _ShadowOffsets[1].xyz)).x;
  shadows_5.z = shadow2D (_ShadowMapTexture, (tmpvar_6 + _ShadowOffsets[2].xyz)).x;
  shadows_5.w = shadow2D (_ShadowMapTexture, (tmpvar_6 + _ShadowOffsets[3].xyz)).x;
  shadows_5 = (_LightShadowData.xxxx + (shadows_5 * (1.0 - _LightShadowData.xxxx)));
  vec3 tmpvar_7;
  vec3 tmpvar_8;
  tmpvar_8 = normalize(tmpvar_4);
  float tmpvar_9;
  tmpvar_9 = max (0.0, dot (tmpvar_1, tmpvar_8));
  tmpvar_7 = (_LightColor0.xyz * ((
    (float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w)
   * texture2D (_LightTextureB0, vec2(
    dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz)
  )).w) * dot (shadows_5, vec4(0.25, 0.25, 0.25, 0.25))));
  vec3 viewDir_10;
  viewDir_10 = -(normalize(xlv_TEXCOORD1));
  float tmpvar_11;
  tmpvar_11 = (1.0 - _Glossiness);
  vec3 tmpvar_12;
  vec3 inVec_13;
  inVec_13 = (tmpvar_8 + viewDir_10);
  tmpvar_12 = (inVec_13 * inversesqrt(max (0.001, 
    dot (inVec_13, inVec_13)
  )));
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_1, viewDir_10));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_8, tmpvar_12));
  float tmpvar_16;
  tmpvar_16 = ((tmpvar_11 * tmpvar_11) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_17;
  float tmpvar_18;
  tmpvar_18 = (10.0 / log2((
    ((1.0 - tmpvar_11) * 0.968)
   + 0.03)));
  tmpvar_17 = (tmpvar_18 * tmpvar_18);
  float x_19;
  x_19 = (1.0 - tmpvar_9);
  float x_20;
  x_20 = (1.0 - tmpvar_14);
  float tmpvar_21;
  tmpvar_21 = (0.5 + ((2.0 * tmpvar_15) * (tmpvar_15 * tmpvar_11)));
  float x_22;
  x_22 = (1.0 - tmpvar_15);
  vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((tmpvar_2 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) * (tmpvar_7 * 
    (((1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((x_19 * x_19) * ((x_19 * x_19) * x_19))
    )) * (1.0 + (
      (tmpvar_21 - 1.0)
     * 
      ((x_20 * x_20) * ((x_20 * x_20) * x_20))
    ))) * tmpvar_9)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_9 * (1.0 - tmpvar_16))
       + tmpvar_16) * (
        (tmpvar_14 * (1.0 - tmpvar_16))
       + tmpvar_16)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_12)), tmpvar_17) * ((tmpvar_17 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_9) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_7) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_22 * x_22) * ((x_22 * x_22) * x_22)))
  )));
  vec4 xlat_varoutput_24;
  xlat_varoutput_24.xyz = tmpvar_23.xyz;
  xlat_varoutput_24.w = 1.0;
  gl_FragData[0] = xlat_varoutput_24;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 102 math, 6 textures, 4 branches
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  vec4 shadowVals_8;
  shadowVals_8.x = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125))).x;
  shadowVals_8.y = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125))).x;
  shadowVals_8.z = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125))).x;
  shadowVals_8.w = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125))).x;
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (shadowVals_8, vec4(((
    sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6))
   * _LightPositionRange.w) * 0.97)));
  vec4 tmpvar_10;
  tmpvar_10 = _LightShadowData.xxxx;
  float tmpvar_11;
  if (tmpvar_9.x) {
    tmpvar_11 = tmpvar_10.x;
  } else {
    tmpvar_11 = 1.0;
  };
  float tmpvar_12;
  if (tmpvar_9.y) {
    tmpvar_12 = tmpvar_10.y;
  } else {
    tmpvar_12 = 1.0;
  };
  float tmpvar_13;
  if (tmpvar_9.z) {
    tmpvar_13 = tmpvar_10.z;
  } else {
    tmpvar_13 = 1.0;
  };
  float tmpvar_14;
  if (tmpvar_9.w) {
    tmpvar_14 = tmpvar_10.w;
  } else {
    tmpvar_14 = 1.0;
  };
  vec4 tmpvar_15;
  tmpvar_15.x = tmpvar_11;
  tmpvar_15.y = tmpvar_12;
  tmpvar_15.z = tmpvar_13;
  tmpvar_15.w = tmpvar_14;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_17 = normalize(tmpvar_6);
  float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_1, tmpvar_17));
  tmpvar_16 = (_LightColor0.xyz * (tmpvar_7.w * dot (tmpvar_15, vec4(0.25, 0.25, 0.25, 0.25))));
  vec3 viewDir_19;
  viewDir_19 = -(tmpvar_2);
  float tmpvar_20;
  tmpvar_20 = (1.0 - _Glossiness);
  vec3 tmpvar_21;
  vec3 inVec_22;
  inVec_22 = (tmpvar_17 + viewDir_19);
  tmpvar_21 = (inVec_22 * inversesqrt(max (0.001, 
    dot (inVec_22, inVec_22)
  )));
  float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_1, viewDir_19));
  float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_17, tmpvar_21));
  float tmpvar_25;
  tmpvar_25 = ((tmpvar_20 * tmpvar_20) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_26;
  float tmpvar_27;
  tmpvar_27 = (10.0 / log2((
    ((1.0 - tmpvar_20) * 0.968)
   + 0.03)));
  tmpvar_26 = (tmpvar_27 * tmpvar_27);
  float x_28;
  x_28 = (1.0 - tmpvar_18);
  float x_29;
  x_29 = (1.0 - tmpvar_23);
  float tmpvar_30;
  tmpvar_30 = (0.5 + ((2.0 * tmpvar_24) * (tmpvar_24 * tmpvar_20)));
  float x_31;
  x_31 = (1.0 - tmpvar_24);
  vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = ((tmpvar_4 * (tmpvar_16 * 
    (((1.0 + (
      (tmpvar_30 - 1.0)
     * 
      ((x_28 * x_28) * ((x_28 * x_28) * x_28))
    )) * (1.0 + (
      (tmpvar_30 - 1.0)
     * 
      ((x_29 * x_29) * ((x_29 * x_29) * x_29))
    ))) * tmpvar_18)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_18 * (1.0 - tmpvar_25))
       + tmpvar_25) * (
        (tmpvar_23 * (1.0 - tmpvar_25))
       + tmpvar_25)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_21)), tmpvar_26) * ((tmpvar_26 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_18) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_16) * (tmpvar_5 + 
    ((1.0 - tmpvar_5) * ((x_31 * x_31) * ((x_31 * x_31) * x_31)))
  )));
  vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = tmpvar_32.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 103 math, 7 textures, 4 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform vec4 unity_LightGammaCorrectionConsts;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  vec4 tmpvar_8;
  tmpvar_8 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  vec4 shadowVals_9;
  shadowVals_9.x = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125))).x;
  shadowVals_9.y = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125))).x;
  shadowVals_9.z = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125))).x;
  shadowVals_9.w = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125))).x;
  bvec4 tmpvar_10;
  tmpvar_10 = lessThan (shadowVals_9, vec4(((
    sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6))
   * _LightPositionRange.w) * 0.97)));
  vec4 tmpvar_11;
  tmpvar_11 = _LightShadowData.xxxx;
  float tmpvar_12;
  if (tmpvar_10.x) {
    tmpvar_12 = tmpvar_11.x;
  } else {
    tmpvar_12 = 1.0;
  };
  float tmpvar_13;
  if (tmpvar_10.y) {
    tmpvar_13 = tmpvar_11.y;
  } else {
    tmpvar_13 = 1.0;
  };
  float tmpvar_14;
  if (tmpvar_10.z) {
    tmpvar_14 = tmpvar_11.z;
  } else {
    tmpvar_14 = 1.0;
  };
  float tmpvar_15;
  if (tmpvar_10.w) {
    tmpvar_15 = tmpvar_11.w;
  } else {
    tmpvar_15 = 1.0;
  };
  vec4 tmpvar_16;
  tmpvar_16.x = tmpvar_12;
  tmpvar_16.y = tmpvar_13;
  tmpvar_16.z = tmpvar_14;
  tmpvar_16.w = tmpvar_15;
  vec3 tmpvar_17;
  vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_6);
  float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_1, tmpvar_18));
  tmpvar_17 = (_LightColor0.xyz * ((tmpvar_7.w * tmpvar_8.w) * dot (tmpvar_16, vec4(0.25, 0.25, 0.25, 0.25))));
  vec3 viewDir_20;
  viewDir_20 = -(tmpvar_2);
  float tmpvar_21;
  tmpvar_21 = (1.0 - _Glossiness);
  vec3 tmpvar_22;
  vec3 inVec_23;
  inVec_23 = (tmpvar_18 + viewDir_20);
  tmpvar_22 = (inVec_23 * inversesqrt(max (0.001, 
    dot (inVec_23, inVec_23)
  )));
  float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_1, viewDir_20));
  float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_18, tmpvar_22));
  float tmpvar_26;
  tmpvar_26 = ((tmpvar_21 * tmpvar_21) * unity_LightGammaCorrectionConsts.w);
  float tmpvar_27;
  float tmpvar_28;
  tmpvar_28 = (10.0 / log2((
    ((1.0 - tmpvar_21) * 0.968)
   + 0.03)));
  tmpvar_27 = (tmpvar_28 * tmpvar_28);
  float x_29;
  x_29 = (1.0 - tmpvar_19);
  float x_30;
  x_30 = (1.0 - tmpvar_24);
  float tmpvar_31;
  tmpvar_31 = (0.5 + ((2.0 * tmpvar_25) * (tmpvar_25 * tmpvar_21)));
  float x_32;
  x_32 = (1.0 - tmpvar_25);
  vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = ((tmpvar_4 * (tmpvar_17 * 
    (((1.0 + (
      (tmpvar_31 - 1.0)
     * 
      ((x_29 * x_29) * ((x_29 * x_29) * x_29))
    )) * (1.0 + (
      (tmpvar_31 - 1.0)
     * 
      ((x_30 * x_30) * ((x_30 * x_30) * x_30))
    ))) * tmpvar_19)
  )) + ((
    max (0.0, (((
      (1.0/((((
        (tmpvar_19 * (1.0 - tmpvar_26))
       + tmpvar_26) * (
        (tmpvar_24 * (1.0 - tmpvar_26))
       + tmpvar_26)) + 0.0001)))
     * 
      (pow (max (0.0, dot (tmpvar_1, tmpvar_22)), tmpvar_27) * ((tmpvar_27 + 1.0) * unity_LightGammaCorrectionConsts.y))
    ) * tmpvar_19) * unity_LightGammaCorrectionConsts.x))
   * tmpvar_17) * (tmpvar_5 + 
    ((1.0 - tmpvar_5) * ((x_32 * x_32) * ((x_32 * x_32) * x_32)))
  )));
  vec4 xlat_varoutput_34;
  xlat_varoutput_34.xyz = tmpvar_33.xyz;
  xlat_varoutput_34.w = 1.0;
  gl_FragData[0] = xlat_varoutput_34;
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLSL"
}
}
 }


 // Stats for Vertex shader:
 //      opengl : 2 avg math (1..3)
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 133839
Program "vp" {
SubProgram "opengl " {
// Stats: 1 math
Keywords { "SHADOWS_DEPTH" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_LightShadowBias;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform mat4 unity_MatrixVP;
void main ()
{
  vec3 vertex_1;
  vertex_1 = gl_Vertex.xyz;
  vec4 clipPos_2;
  if ((unity_LightShadowBias.z != 0.0)) {
    vec4 tmpvar_3;
    tmpvar_3.w = 1.0;
    tmpvar_3.xyz = vertex_1;
    vec3 tmpvar_4;
    tmpvar_4 = (_Object2World * tmpvar_3).xyz;
    vec4 v_5;
    v_5.x = _World2Object[0].x;
    v_5.y = _World2Object[1].x;
    v_5.z = _World2Object[2].x;
    v_5.w = _World2Object[3].x;
    vec4 v_6;
    v_6.x = _World2Object[0].y;
    v_6.y = _World2Object[1].y;
    v_6.z = _World2Object[2].y;
    v_6.w = _World2Object[3].y;
    vec4 v_7;
    v_7.x = _World2Object[0].z;
    v_7.y = _World2Object[1].z;
    v_7.z = _World2Object[2].z;
    v_7.w = _World2Object[3].z;
    vec3 tmpvar_8;
    tmpvar_8 = normalize(((
      (v_5.xyz * gl_Normal.x)
     + 
      (v_6.xyz * gl_Normal.y)
    ) + (v_7.xyz * gl_Normal.z)));
    float tmpvar_9;
    tmpvar_9 = dot (tmpvar_8, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_4 * _WorldSpaceLightPos0.w)
    )));
    vec4 tmpvar_10;
    tmpvar_10.w = 1.0;
    tmpvar_10.xyz = (tmpvar_4 - (tmpvar_8 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_9 * tmpvar_9)))
    )));
    clipPos_2 = (unity_MatrixVP * tmpvar_10);
  } else {
    vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = vertex_1;
    clipPos_2 = (gl_ModelViewProjectionMatrix * tmpvar_11);
  };
  vec4 clipPos_12;
  clipPos_12.xyw = clipPos_2.xyw;
  clipPos_12.z = (clipPos_2.z + clamp ((unity_LightShadowBias.x / clipPos_2.w), 0.0, 1.0));
  clipPos_12.z = mix (clipPos_12.z, max (clipPos_12.z, -(clipPos_2.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_12;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "opengl " {
// Stats: 3 math
Keywords { "SHADOWS_CUBE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  xlv_TEXCOORD0 = ((_Object2World * gl_Vertex).xyz - _LightPositionRange.xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  gl_FragData[0] = vec4((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) * _LightPositionRange.w));
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
"!!GLSL"
}
}
 }


 // Stats for Vertex shader:
 //      opengl : 89 avg math (88..90), 4 texture, 9 branch
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="Deferred" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 200435
Program "vp" {
SubProgram "opengl " {
// Stats: 90 math, 4 textures, 9 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  vec3 tmpvar_9;
  tmpvar_9 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec3 x2_16;
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x2_16.x = dot (unity_SHBr, tmpvar_17);
  x2_16.y = dot (unity_SHBg, tmpvar_17);
  x2_16.z = dot (unity_SHBb, tmpvar_17);
  tmpvar_7.xyz = (x2_16 + (unity_SHC.xyz * (
    (tmpvar_15.x * tmpvar_15.x)
   - 
    (tmpvar_15.y * tmpvar_15.y)
  )));
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD1);
  vec2 tmpvar_3;
  tmpvar_3.x = _Metallic;
  tmpvar_3.y = _Glossiness;
  float tmpvar_4;
  tmpvar_4 = tmpvar_3.y;
  vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_6;
  float oneMinusReflectivity_7;
  vec3 tmpvar_8;
  tmpvar_8 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_5, vec3(_Metallic));
  oneMinusReflectivity_7 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_6 = (tmpvar_5 * oneMinusReflectivity_7);
  float tmpvar_9;
  tmpvar_9 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  vec3 tmpvar_10;
  vec3 tmpvar_11;
  tmpvar_11 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_1;
  vec3 x1_13;
  x1_13.x = dot (unity_SHAr, tmpvar_12);
  x1_13.y = dot (unity_SHAg, tmpvar_12);
  x1_13.z = dot (unity_SHAb, tmpvar_12);
  tmpvar_10 = (xlv_TEXCOORD5.xyz + x1_13);
  tmpvar_10 = (tmpvar_10 * tmpvar_9);
  vec3 tmpvar_14;
  tmpvar_14 = (tmpvar_2 - (2.0 * (
    dot (tmpvar_1, tmpvar_2)
   * tmpvar_1)));
  vec3 worldNormal_15;
  worldNormal_15 = tmpvar_14;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_16;
    tmpvar_16 = normalize(tmpvar_14);
    vec3 tmpvar_17;
    tmpvar_17 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD6) / tmpvar_16);
    vec3 tmpvar_18;
    tmpvar_18 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD6) / tmpvar_16);
    bvec3 tmpvar_19;
    tmpvar_19 = greaterThan (tmpvar_16, vec3(0.0, 0.0, 0.0));
    float tmpvar_20;
    if (tmpvar_19.x) {
      tmpvar_20 = tmpvar_17.x;
    } else {
      tmpvar_20 = tmpvar_18.x;
    };
    float tmpvar_21;
    if (tmpvar_19.y) {
      tmpvar_21 = tmpvar_17.y;
    } else {
      tmpvar_21 = tmpvar_18.y;
    };
    float tmpvar_22;
    if (tmpvar_19.z) {
      tmpvar_22 = tmpvar_17.z;
    } else {
      tmpvar_22 = tmpvar_18.z;
    };
    vec3 tmpvar_23;
    tmpvar_23 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_15 = (((
      (tmpvar_23 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD6) + (tmpvar_16 * 
      min (min (tmpvar_20, tmpvar_21), tmpvar_22)
    )) - tmpvar_23);
  };
  vec4 tmpvar_24;
  tmpvar_24.xyz = worldNormal_15;
  tmpvar_24.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_25;
  tmpvar_25 = textureCubeLod (unity_SpecCube0, worldNormal_15, tmpvar_24.w);
  vec3 tmpvar_26;
  tmpvar_26 = ((unity_SpecCube0_HDR.x * pow (tmpvar_25.w, unity_SpecCube0_HDR.y)) * tmpvar_25.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_27;
    worldNormal_27 = tmpvar_14;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_28;
      tmpvar_28 = normalize(tmpvar_14);
      vec3 tmpvar_29;
      tmpvar_29 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD6) / tmpvar_28);
      vec3 tmpvar_30;
      tmpvar_30 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD6) / tmpvar_28);
      bvec3 tmpvar_31;
      tmpvar_31 = greaterThan (tmpvar_28, vec3(0.0, 0.0, 0.0));
      float tmpvar_32;
      if (tmpvar_31.x) {
        tmpvar_32 = tmpvar_29.x;
      } else {
        tmpvar_32 = tmpvar_30.x;
      };
      float tmpvar_33;
      if (tmpvar_31.y) {
        tmpvar_33 = tmpvar_29.y;
      } else {
        tmpvar_33 = tmpvar_30.y;
      };
      float tmpvar_34;
      if (tmpvar_31.z) {
        tmpvar_34 = tmpvar_29.z;
      } else {
        tmpvar_34 = tmpvar_30.z;
      };
      vec3 tmpvar_35;
      tmpvar_35 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_27 = (((
        (tmpvar_35 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD6) + (tmpvar_28 * 
        min (min (tmpvar_32, tmpvar_33), tmpvar_34)
      )) - tmpvar_35);
    };
    vec4 tmpvar_36;
    tmpvar_36.xyz = worldNormal_27;
    tmpvar_36.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_37;
    tmpvar_37 = textureCubeLod (unity_SpecCube1, worldNormal_27, tmpvar_36.w);
    tmpvar_11 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_37.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_37.xyz), tmpvar_26, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_11 = tmpvar_26;
  };
  tmpvar_11 = (tmpvar_11 * tmpvar_9);
  float x_38;
  x_38 = (1.0 - max (0.0, dot (tmpvar_1, 
    -(tmpvar_2)
  )));
  vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = ((tmpvar_6 * tmpvar_10) + (tmpvar_11 * mix (tmpvar_8, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_7)), 0.0, 1.0)
  ), vec3(
    ((x_38 * x_38) * ((x_38 * x_38) * x_38))
  ))));
  vec4 tmpvar_40;
  tmpvar_40.xyz = tmpvar_6;
  tmpvar_40.w = tmpvar_9;
  vec4 tmpvar_41;
  tmpvar_41.xyz = tmpvar_8;
  tmpvar_41.w = tmpvar_4;
  vec4 tmpvar_42;
  tmpvar_42.w = 1.0;
  tmpvar_42.xyz = ((tmpvar_1 * 0.5) + 0.5);
  vec4 tmpvar_43;
  tmpvar_43.w = 1.0;
  tmpvar_43.xyz = exp2(-(tmpvar_39.xyz));
  gl_FragData[0] = tmpvar_40;
  gl_FragData[1] = tmpvar_41;
  gl_FragData[2] = tmpvar_42;
  gl_FragData[3] = tmpvar_43;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 88 math, 4 textures, 9 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  vec3 tmpvar_9;
  tmpvar_9 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec3 x2_16;
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x2_16.x = dot (unity_SHBr, tmpvar_17);
  x2_16.y = dot (unity_SHBg, tmpvar_17);
  x2_16.z = dot (unity_SHBb, tmpvar_17);
  tmpvar_7.xyz = (x2_16 + (unity_SHC.xyz * (
    (tmpvar_15.x * tmpvar_15.x)
   - 
    (tmpvar_15.y * tmpvar_15.y)
  )));
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD1);
  vec2 tmpvar_3;
  tmpvar_3.x = _Metallic;
  tmpvar_3.y = _Glossiness;
  float tmpvar_4;
  tmpvar_4 = tmpvar_3.y;
  vec3 tmpvar_5;
  tmpvar_5 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_6;
  float oneMinusReflectivity_7;
  vec3 tmpvar_8;
  tmpvar_8 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_5, vec3(_Metallic));
  oneMinusReflectivity_7 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_6 = (tmpvar_5 * oneMinusReflectivity_7);
  float tmpvar_9;
  tmpvar_9 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  vec3 tmpvar_10;
  vec3 tmpvar_11;
  tmpvar_11 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_1;
  vec3 x1_13;
  x1_13.x = dot (unity_SHAr, tmpvar_12);
  x1_13.y = dot (unity_SHAg, tmpvar_12);
  x1_13.z = dot (unity_SHAb, tmpvar_12);
  tmpvar_10 = (xlv_TEXCOORD5.xyz + x1_13);
  tmpvar_10 = (tmpvar_10 * tmpvar_9);
  vec3 tmpvar_14;
  tmpvar_14 = (tmpvar_2 - (2.0 * (
    dot (tmpvar_1, tmpvar_2)
   * tmpvar_1)));
  vec3 worldNormal_15;
  worldNormal_15 = tmpvar_14;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_16;
    tmpvar_16 = normalize(tmpvar_14);
    vec3 tmpvar_17;
    tmpvar_17 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD6) / tmpvar_16);
    vec3 tmpvar_18;
    tmpvar_18 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD6) / tmpvar_16);
    bvec3 tmpvar_19;
    tmpvar_19 = greaterThan (tmpvar_16, vec3(0.0, 0.0, 0.0));
    float tmpvar_20;
    if (tmpvar_19.x) {
      tmpvar_20 = tmpvar_17.x;
    } else {
      tmpvar_20 = tmpvar_18.x;
    };
    float tmpvar_21;
    if (tmpvar_19.y) {
      tmpvar_21 = tmpvar_17.y;
    } else {
      tmpvar_21 = tmpvar_18.y;
    };
    float tmpvar_22;
    if (tmpvar_19.z) {
      tmpvar_22 = tmpvar_17.z;
    } else {
      tmpvar_22 = tmpvar_18.z;
    };
    vec3 tmpvar_23;
    tmpvar_23 = ((unity_SpecCube0_BoxMax.xyz + unity_SpecCube0_BoxMin.xyz) * 0.5);
    worldNormal_15 = (((
      (tmpvar_23 - unity_SpecCube0_ProbePosition.xyz)
     + xlv_TEXCOORD6) + (tmpvar_16 * 
      min (min (tmpvar_20, tmpvar_21), tmpvar_22)
    )) - tmpvar_23);
  };
  vec4 tmpvar_24;
  tmpvar_24.xyz = worldNormal_15;
  tmpvar_24.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
  vec4 tmpvar_25;
  tmpvar_25 = textureCubeLod (unity_SpecCube0, worldNormal_15, tmpvar_24.w);
  vec3 tmpvar_26;
  tmpvar_26 = ((unity_SpecCube0_HDR.x * pow (tmpvar_25.w, unity_SpecCube0_HDR.y)) * tmpvar_25.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldNormal_27;
    worldNormal_27 = tmpvar_14;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_28;
      tmpvar_28 = normalize(tmpvar_14);
      vec3 tmpvar_29;
      tmpvar_29 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD6) / tmpvar_28);
      vec3 tmpvar_30;
      tmpvar_30 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD6) / tmpvar_28);
      bvec3 tmpvar_31;
      tmpvar_31 = greaterThan (tmpvar_28, vec3(0.0, 0.0, 0.0));
      float tmpvar_32;
      if (tmpvar_31.x) {
        tmpvar_32 = tmpvar_29.x;
      } else {
        tmpvar_32 = tmpvar_30.x;
      };
      float tmpvar_33;
      if (tmpvar_31.y) {
        tmpvar_33 = tmpvar_29.y;
      } else {
        tmpvar_33 = tmpvar_30.y;
      };
      float tmpvar_34;
      if (tmpvar_31.z) {
        tmpvar_34 = tmpvar_29.z;
      } else {
        tmpvar_34 = tmpvar_30.z;
      };
      vec3 tmpvar_35;
      tmpvar_35 = ((unity_SpecCube1_BoxMax.xyz + unity_SpecCube1_BoxMin.xyz) * 0.5);
      worldNormal_27 = (((
        (tmpvar_35 - unity_SpecCube1_ProbePosition.xyz)
       + xlv_TEXCOORD6) + (tmpvar_28 * 
        min (min (tmpvar_32, tmpvar_33), tmpvar_34)
      )) - tmpvar_35);
    };
    vec4 tmpvar_36;
    tmpvar_36.xyz = worldNormal_27;
    tmpvar_36.w = (pow ((1.0 - _Glossiness), 0.75) * 7.0);
    vec4 tmpvar_37;
    tmpvar_37 = textureCubeLod (unity_SpecCube1, worldNormal_27, tmpvar_36.w);
    tmpvar_11 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_37.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_37.xyz), tmpvar_26, unity_SpecCube0_BoxMin.www);
  } else {
    tmpvar_11 = tmpvar_26;
  };
  tmpvar_11 = (tmpvar_11 * tmpvar_9);
  float x_38;
  x_38 = (1.0 - max (0.0, dot (tmpvar_1, 
    -(tmpvar_2)
  )));
  vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = ((tmpvar_6 * tmpvar_10) + (tmpvar_11 * mix (tmpvar_8, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_7)), 0.0, 1.0)
  ), vec3(
    ((x_38 * x_38) * ((x_38 * x_38) * x_38))
  ))));
  vec4 tmpvar_40;
  tmpvar_40.xyz = tmpvar_6;
  tmpvar_40.w = tmpvar_9;
  vec4 tmpvar_41;
  tmpvar_41.xyz = tmpvar_8;
  tmpvar_41.w = tmpvar_4;
  vec4 tmpvar_42;
  tmpvar_42.w = 1.0;
  tmpvar_42.xyz = ((tmpvar_1 * 0.5) + 0.5);
  vec4 tmpvar_43;
  tmpvar_43.w = 1.0;
  tmpvar_43.xyz = tmpvar_39.xyz;
  gl_FragData[0] = tmpvar_40;
  gl_FragData[1] = tmpvar_41;
  gl_FragData[2] = tmpvar_42;
  gl_FragData[3] = tmpvar_43;
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"!!GLSL"
}
}
 }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //      opengl : 47 avg math (47..48), 4 avg texture (4..5)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 374778
Program "vp" {
SubProgram "opengl " {
// Stats: 47 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_9;
  texcoord_9.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_1;
  } else {
    tmpvar_10 = tmpvar_2;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_11;
  v_11.x = _World2Object[0].x;
  v_11.y = _World2Object[1].x;
  v_11.z = _World2Object[2].x;
  v_11.w = _World2Object[3].x;
  vec4 v_12;
  v_12.x = _World2Object[0].y;
  v_12.y = _World2Object[1].y;
  v_12.z = _World2Object[2].y;
  v_12.w = _World2Object[3].y;
  vec4 v_13;
  v_13.x = _World2Object[0].z;
  v_13.y = _World2Object[1].z;
  v_13.z = _World2Object[2].z;
  v_13.w = _World2Object[3].z;
  vec3 tmpvar_14;
  tmpvar_14 = normalize(((
    (v_11.xyz * gl_Normal.x)
   + 
    (v_12.xyz * gl_Normal.y)
  ) + (v_13.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_14;
  vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_14;
  vec3 x2_16;
  vec3 x1_17;
  x1_17.x = dot (unity_SHAr, tmpvar_15);
  x1_17.y = dot (unity_SHAg, tmpvar_15);
  x1_17.z = dot (unity_SHAb, tmpvar_15);
  vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_14.xyzz * tmpvar_14.yzzx);
  x2_16.x = dot (unity_SHBr, tmpvar_18);
  x2_16.y = dot (unity_SHBg, tmpvar_18);
  x2_16.z = dot (unity_SHBb, tmpvar_18);
  tmpvar_7.xyz = ((x2_16 + (unity_SHC.xyz * 
    ((tmpvar_14.x * tmpvar_14.x) - (tmpvar_14.y * tmpvar_14.y))
  )) + x1_17);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube unity_SpecCube0;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  float oneMinusReflectivity_5;
  vec3 tmpvar_6;
  tmpvar_6 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  oneMinusReflectivity_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_4 = (tmpvar_3 * oneMinusReflectivity_5);
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  vec3 tmpvar_8;
  vec3 I_9;
  vec3 tmpvar_10;
  tmpvar_10 = -(xlv_TEXCOORD1);
  I_9 = -(tmpvar_10);
  vec4 tmpvar_11;
  tmpvar_11.xyz = (I_9 - (2.0 * (
    dot (tmpvar_2, I_9)
   * tmpvar_2)));
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  tmpvar_11.w = (tmpvar_12 * 7.0);
  vec4 tmpvar_13;
  tmpvar_13 = textureCube (unity_SpecCube0, tmpvar_11.xyz, tmpvar_11.w);
  tmpvar_8 = ((unity_SpecCube0_HDR.x * pow (tmpvar_13.w, unity_SpecCube0_HDR.y)) * tmpvar_13.xyz);
  tmpvar_8 = (tmpvar_8 * tmpvar_7.y);
  vec2 tmpvar_14;
  tmpvar_14.x = dot ((tmpvar_10 - (2.0 * 
    (dot (tmpvar_2, tmpvar_10) * tmpvar_2)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_2, tmpvar_10), 0.0, 1.0));
  vec2 tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14));
  vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = tmpvar_12;
  vec3 tmpvar_17;
  tmpvar_17 = (((
    ((tmpvar_4 + ((texture2D (unity_NHxRoughness, tmpvar_16).w * 16.0) * tmpvar_6)) * _LightColor0.xyz)
   * 
    clamp (dot (tmpvar_2, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (xlv_TEXCOORD5.xyz * tmpvar_7.y)
   * tmpvar_4)) + (tmpvar_8 * mix (tmpvar_6, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_5)), 0.0, 1.0)
  ), tmpvar_15.yyy)));
  vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_17;
  c_1.w = tmpvar_18.w;
  c_1.xyz = tmpvar_17;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = c_1.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 48 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_9;
  texcoord_9.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_1;
  } else {
    tmpvar_10 = tmpvar_2;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_11;
  v_11.x = _World2Object[0].x;
  v_11.y = _World2Object[1].x;
  v_11.z = _World2Object[2].x;
  v_11.w = _World2Object[3].x;
  vec4 v_12;
  v_12.x = _World2Object[0].y;
  v_12.y = _World2Object[1].y;
  v_12.z = _World2Object[2].y;
  v_12.w = _World2Object[3].y;
  vec4 v_13;
  v_13.x = _World2Object[0].z;
  v_13.y = _World2Object[1].z;
  v_13.z = _World2Object[2].z;
  v_13.w = _World2Object[3].z;
  vec3 tmpvar_14;
  tmpvar_14 = normalize(((
    (v_11.xyz * gl_Normal.x)
   + 
    (v_12.xyz * gl_Normal.y)
  ) + (v_13.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_14;
  vec4 o_15;
  vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_3 * 0.5);
  vec2 tmpvar_17;
  tmpvar_17.x = tmpvar_16.x;
  tmpvar_17.y = (tmpvar_16.y * _ProjectionParams.x);
  o_15.xy = (tmpvar_17 + tmpvar_16.w);
  o_15.zw = tmpvar_3.zw;
  vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_14;
  vec3 x2_19;
  vec3 x1_20;
  x1_20.x = dot (unity_SHAr, tmpvar_18);
  x1_20.y = dot (unity_SHAg, tmpvar_18);
  x1_20.z = dot (unity_SHAb, tmpvar_18);
  vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_14.xyzz * tmpvar_14.yzzx);
  x2_19.x = dot (unity_SHBr, tmpvar_21);
  x2_19.y = dot (unity_SHBg, tmpvar_21);
  x2_19.z = dot (unity_SHBb, tmpvar_21);
  tmpvar_7.xyz = ((x2_19 + (unity_SHC.xyz * 
    ((tmpvar_14.x * tmpvar_14.x) - (tmpvar_14.y * tmpvar_14.y))
  )) + x1_20);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = o_15;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube unity_SpecCube0;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  float oneMinusReflectivity_5;
  vec3 tmpvar_6;
  tmpvar_6 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  oneMinusReflectivity_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_4 = (tmpvar_3 * oneMinusReflectivity_5);
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  vec3 tmpvar_8;
  vec3 I_9;
  vec3 tmpvar_10;
  tmpvar_10 = -(xlv_TEXCOORD1);
  I_9 = -(tmpvar_10);
  vec4 tmpvar_11;
  tmpvar_11.xyz = (I_9 - (2.0 * (
    dot (tmpvar_2, I_9)
   * tmpvar_2)));
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  tmpvar_11.w = (tmpvar_12 * 7.0);
  vec4 tmpvar_13;
  tmpvar_13 = textureCube (unity_SpecCube0, tmpvar_11.xyz, tmpvar_11.w);
  tmpvar_8 = ((unity_SpecCube0_HDR.x * pow (tmpvar_13.w, unity_SpecCube0_HDR.y)) * tmpvar_13.xyz);
  tmpvar_8 = (tmpvar_8 * tmpvar_7.y);
  vec2 tmpvar_14;
  tmpvar_14.x = dot ((tmpvar_10 - (2.0 * 
    (dot (tmpvar_2, tmpvar_10) * tmpvar_2)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_2, tmpvar_10), 0.0, 1.0));
  vec2 tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14));
  vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = tmpvar_12;
  vec3 tmpvar_17;
  tmpvar_17 = (((
    ((tmpvar_4 + ((texture2D (unity_NHxRoughness, tmpvar_16).w * 16.0) * tmpvar_6)) * (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x))
   * 
    clamp (dot (tmpvar_2, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (xlv_TEXCOORD5.xyz * tmpvar_7.y)
   * tmpvar_4)) + (tmpvar_8 * mix (tmpvar_6, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_5)), 0.0, 1.0)
  ), tmpvar_15.yyy)));
  vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_17;
  c_1.w = tmpvar_18.w;
  c_1.xyz = tmpvar_17;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = c_1.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 47 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_9;
  texcoord_9.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_1;
  } else {
    tmpvar_10 = tmpvar_2;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_11;
  v_11.x = _World2Object[0].x;
  v_11.y = _World2Object[1].x;
  v_11.z = _World2Object[2].x;
  v_11.w = _World2Object[3].x;
  vec4 v_12;
  v_12.x = _World2Object[0].y;
  v_12.y = _World2Object[1].y;
  v_12.z = _World2Object[2].y;
  v_12.w = _World2Object[3].y;
  vec4 v_13;
  v_13.x = _World2Object[0].z;
  v_13.y = _World2Object[1].z;
  v_13.z = _World2Object[2].z;
  v_13.w = _World2Object[3].z;
  vec3 tmpvar_14;
  tmpvar_14 = normalize(((
    (v_11.xyz * gl_Normal.x)
   + 
    (v_12.xyz * gl_Normal.y)
  ) + (v_13.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_14;
  vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_14;
  vec3 x2_16;
  vec3 x1_17;
  x1_17.x = dot (unity_SHAr, tmpvar_15);
  x1_17.y = dot (unity_SHAg, tmpvar_15);
  x1_17.z = dot (unity_SHAb, tmpvar_15);
  vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_14.xyzz * tmpvar_14.yzzx);
  x2_16.x = dot (unity_SHBr, tmpvar_18);
  x2_16.y = dot (unity_SHBg, tmpvar_18);
  x2_16.z = dot (unity_SHBb, tmpvar_18);
  tmpvar_7.xyz = ((x2_16 + (unity_SHC.xyz * 
    ((tmpvar_14.x * tmpvar_14.x) - (tmpvar_14.y * tmpvar_14.y))
  )) + x1_17);
  vec3 col_19;
  vec4 ndotl_20;
  vec4 lengthSq_21;
  vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosX0 - tmpvar_8.x);
  vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosY0 - tmpvar_8.y);
  vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_21 = (tmpvar_22 * tmpvar_22);
  lengthSq_21 = (lengthSq_21 + (tmpvar_23 * tmpvar_23));
  lengthSq_21 = (lengthSq_21 + (tmpvar_24 * tmpvar_24));
  ndotl_20 = (tmpvar_22 * tmpvar_14.x);
  ndotl_20 = (ndotl_20 + (tmpvar_23 * tmpvar_14.y));
  ndotl_20 = (ndotl_20 + (tmpvar_24 * tmpvar_14.z));
  vec4 tmpvar_25;
  tmpvar_25 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_20 * inversesqrt(lengthSq_21)));
  ndotl_20 = tmpvar_25;
  vec4 tmpvar_26;
  tmpvar_26 = (tmpvar_25 * (1.0/((1.0 + 
    (lengthSq_21 * unity_4LightAtten0)
  ))));
  col_19 = (unity_LightColor[0].xyz * tmpvar_26.x);
  col_19 = (col_19 + (unity_LightColor[1].xyz * tmpvar_26.y));
  col_19 = (col_19 + (unity_LightColor[2].xyz * tmpvar_26.z));
  col_19 = (col_19 + (unity_LightColor[3].xyz * tmpvar_26.w));
  tmpvar_7.xyz = (tmpvar_7.xyz + col_19);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube unity_SpecCube0;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  float oneMinusReflectivity_5;
  vec3 tmpvar_6;
  tmpvar_6 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  oneMinusReflectivity_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_4 = (tmpvar_3 * oneMinusReflectivity_5);
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  vec3 tmpvar_8;
  vec3 I_9;
  vec3 tmpvar_10;
  tmpvar_10 = -(xlv_TEXCOORD1);
  I_9 = -(tmpvar_10);
  vec4 tmpvar_11;
  tmpvar_11.xyz = (I_9 - (2.0 * (
    dot (tmpvar_2, I_9)
   * tmpvar_2)));
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  tmpvar_11.w = (tmpvar_12 * 7.0);
  vec4 tmpvar_13;
  tmpvar_13 = textureCube (unity_SpecCube0, tmpvar_11.xyz, tmpvar_11.w);
  tmpvar_8 = ((unity_SpecCube0_HDR.x * pow (tmpvar_13.w, unity_SpecCube0_HDR.y)) * tmpvar_13.xyz);
  tmpvar_8 = (tmpvar_8 * tmpvar_7.y);
  vec2 tmpvar_14;
  tmpvar_14.x = dot ((tmpvar_10 - (2.0 * 
    (dot (tmpvar_2, tmpvar_10) * tmpvar_2)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_2, tmpvar_10), 0.0, 1.0));
  vec2 tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14));
  vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = tmpvar_12;
  vec3 tmpvar_17;
  tmpvar_17 = (((
    ((tmpvar_4 + ((texture2D (unity_NHxRoughness, tmpvar_16).w * 16.0) * tmpvar_6)) * _LightColor0.xyz)
   * 
    clamp (dot (tmpvar_2, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (xlv_TEXCOORD5.xyz * tmpvar_7.y)
   * tmpvar_4)) + (tmpvar_8 * mix (tmpvar_6, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_5)), 0.0, 1.0)
  ), tmpvar_15.yyy)));
  vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_17;
  c_1.w = tmpvar_18.w;
  c_1.xyz = tmpvar_17;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = c_1.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 48 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_9;
  texcoord_9.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_1;
  } else {
    tmpvar_10 = tmpvar_2;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_11;
  v_11.x = _World2Object[0].x;
  v_11.y = _World2Object[1].x;
  v_11.z = _World2Object[2].x;
  v_11.w = _World2Object[3].x;
  vec4 v_12;
  v_12.x = _World2Object[0].y;
  v_12.y = _World2Object[1].y;
  v_12.z = _World2Object[2].y;
  v_12.w = _World2Object[3].y;
  vec4 v_13;
  v_13.x = _World2Object[0].z;
  v_13.y = _World2Object[1].z;
  v_13.z = _World2Object[2].z;
  v_13.w = _World2Object[3].z;
  vec3 tmpvar_14;
  tmpvar_14 = normalize(((
    (v_11.xyz * gl_Normal.x)
   + 
    (v_12.xyz * gl_Normal.y)
  ) + (v_13.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_14;
  vec4 o_15;
  vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_3 * 0.5);
  vec2 tmpvar_17;
  tmpvar_17.x = tmpvar_16.x;
  tmpvar_17.y = (tmpvar_16.y * _ProjectionParams.x);
  o_15.xy = (tmpvar_17 + tmpvar_16.w);
  o_15.zw = tmpvar_3.zw;
  vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_14;
  vec3 x2_19;
  vec3 x1_20;
  x1_20.x = dot (unity_SHAr, tmpvar_18);
  x1_20.y = dot (unity_SHAg, tmpvar_18);
  x1_20.z = dot (unity_SHAb, tmpvar_18);
  vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_14.xyzz * tmpvar_14.yzzx);
  x2_19.x = dot (unity_SHBr, tmpvar_21);
  x2_19.y = dot (unity_SHBg, tmpvar_21);
  x2_19.z = dot (unity_SHBb, tmpvar_21);
  tmpvar_7.xyz = ((x2_19 + (unity_SHC.xyz * 
    ((tmpvar_14.x * tmpvar_14.x) - (tmpvar_14.y * tmpvar_14.y))
  )) + x1_20);
  vec3 col_22;
  vec4 ndotl_23;
  vec4 lengthSq_24;
  vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_8.x);
  vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_8.y);
  vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  ndotl_23 = (tmpvar_25 * tmpvar_14.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_14.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_14.z));
  vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_23 * inversesqrt(lengthSq_24)));
  ndotl_23 = tmpvar_28;
  vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (lengthSq_24 * unity_4LightAtten0)
  ))));
  col_22 = (unity_LightColor[0].xyz * tmpvar_29.x);
  col_22 = (col_22 + (unity_LightColor[1].xyz * tmpvar_29.y));
  col_22 = (col_22 + (unity_LightColor[2].xyz * tmpvar_29.z));
  col_22 = (col_22 + (unity_LightColor[3].xyz * tmpvar_29.w));
  tmpvar_7.xyz = (tmpvar_7.xyz + col_22);
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = normalize((tmpvar_8.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = o_15;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube unity_SpecCube0;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  float oneMinusReflectivity_5;
  vec3 tmpvar_6;
  tmpvar_6 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  oneMinusReflectivity_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_4 = (tmpvar_3 * oneMinusReflectivity_5);
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy);
  vec3 tmpvar_8;
  vec3 I_9;
  vec3 tmpvar_10;
  tmpvar_10 = -(xlv_TEXCOORD1);
  I_9 = -(tmpvar_10);
  vec4 tmpvar_11;
  tmpvar_11.xyz = (I_9 - (2.0 * (
    dot (tmpvar_2, I_9)
   * tmpvar_2)));
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  tmpvar_11.w = (tmpvar_12 * 7.0);
  vec4 tmpvar_13;
  tmpvar_13 = textureCube (unity_SpecCube0, tmpvar_11.xyz, tmpvar_11.w);
  tmpvar_8 = ((unity_SpecCube0_HDR.x * pow (tmpvar_13.w, unity_SpecCube0_HDR.y)) * tmpvar_13.xyz);
  tmpvar_8 = (tmpvar_8 * tmpvar_7.y);
  vec2 tmpvar_14;
  tmpvar_14.x = dot ((tmpvar_10 - (2.0 * 
    (dot (tmpvar_2, tmpvar_10) * tmpvar_2)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_2, tmpvar_10), 0.0, 1.0));
  vec2 tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14));
  vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = tmpvar_12;
  vec3 tmpvar_17;
  tmpvar_17 = (((
    ((tmpvar_4 + ((texture2D (unity_NHxRoughness, tmpvar_16).w * 16.0) * tmpvar_6)) * (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x))
   * 
    clamp (dot (tmpvar_2, _WorldSpaceLightPos0.xyz), 0.0, 1.0)
  ) + (
    (xlv_TEXCOORD5.xyz * tmpvar_7.y)
   * tmpvar_4)) + (tmpvar_8 * mix (tmpvar_6, vec3(
    clamp ((_Glossiness + (1.0 - oneMinusReflectivity_5)), 0.0, 1.0)
  ), tmpvar_15.yyy)));
  vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_17;
  c_1.w = tmpvar_18.w;
  c_1.xyz = tmpvar_17;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = c_1.xyz;
  xlat_varoutput_19.w = 1.0;
  gl_FragData[0] = xlat_varoutput_19;
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
}
 }


 // Stats for Vertex shader:
 //      opengl : 32 avg math (28..40), 3 avg texture (2..5), 0 avg branch (0..1)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend [_SrcBlend] One
  GpuProgramID 456985
Program "vp" {
SubProgram "opengl " {
// Stats: 30 math, 3 textures
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_1, viewDir_4) * tmpvar_1)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_1, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((
    (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)))
   + 
    ((texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0) * mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic)))
  ) * (_LightColor0.xyz * texture2D (_LightTexture0, vec2(
    dot (xlv_TEXCOORD5, xlv_TEXCOORD5)
  )).w)) * clamp (dot (tmpvar_1, tmpvar_3), 0.0, 1.0));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 28 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_1, viewDir_4) * tmpvar_1)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_1, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((
    (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)))
   + 
    ((texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0) * mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic)))
  ) * _LightColor0.xyz) * clamp (dot (tmpvar_1, tmpvar_3), 0.0, 1.0));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 36 math, 4 textures
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex));
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_1, viewDir_4) * tmpvar_1)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_1, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((
    (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)))
   + 
    ((texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0) * mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic)))
  ) * (_LightColor0.xyz * 
    ((float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz))).w)
  )) * clamp (dot (tmpvar_1, tmpvar_3), 0.0, 1.0));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 31 math, 4 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_1, viewDir_4) * tmpvar_1)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_1, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((
    (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)))
   + 
    ((texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0) * mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic)))
  ) * (_LightColor0.xyz * 
    (texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5))).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w)
  )) * clamp (dot (tmpvar_1, tmpvar_3), 0.0, 1.0));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 29 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xy;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_1, viewDir_4) * tmpvar_1)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_1, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((
    (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)))
   + 
    ((texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0) * mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic)))
  ) * (_LightColor0.xyz * texture2D (_LightTexture0, xlv_TEXCOORD5).w)) * clamp (dot (tmpvar_1, tmpvar_3), 0.0, 1.0));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 40 math, 5 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform mat4 unity_World2Shadow[4];

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25);
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * tmpvar_25);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_1, viewDir_4) * tmpvar_1)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_1, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((
    (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)))
   + 
    ((texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0) * mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic)))
  ) * (_LightColor0.xyz * 
    (((float(
      (xlv_TEXCOORD5.z > 0.0)
    ) * texture2D (_LightTexture0, (
      (xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w)
     + 0.5)).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz))).w) * (_LightShadowData.x + (shadow2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x * (1.0 - _LightShadowData.x))))
  )) * clamp (dot (tmpvar_1, tmpvar_3), 0.0, 1.0));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 29 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec4 o_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_3 * 0.5);
  vec2 tmpvar_26;
  tmpvar_26.x = tmpvar_25.x;
  tmpvar_26.y = (tmpvar_25.y * _ProjectionParams.x);
  o_24.xy = (tmpvar_26 + tmpvar_25.w);
  o_24.zw = tmpvar_3.zw;
  vec3 tmpvar_27;
  tmpvar_27 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_27.x;
  tmpvar_5.w = tmpvar_27.y;
  tmpvar_6.w = tmpvar_27.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = o_24;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_1, viewDir_4) * tmpvar_1)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_1, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((
    (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)))
   + 
    ((texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0) * mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic)))
  ) * (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x)) * clamp (dot (tmpvar_1, tmpvar_3), 0.0, 1.0));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 30 math, 4 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec4 o_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_3 * 0.5);
  vec2 tmpvar_26;
  tmpvar_26.x = tmpvar_25.x;
  tmpvar_26.y = (tmpvar_25.y * _ProjectionParams.x);
  o_24.xy = (tmpvar_26 + tmpvar_25.w);
  o_24.zw = tmpvar_3.zw;
  vec3 tmpvar_27;
  tmpvar_27 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_27.x;
  tmpvar_5.w = tmpvar_27.y;
  tmpvar_6.w = tmpvar_27.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xy;
  xlv_TEXCOORD6 = o_24;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_1, viewDir_4) * tmpvar_1)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_1, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((
    (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)))
   + 
    ((texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0) * mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic)))
  ) * (_LightColor0.xyz * 
    (texture2D (_LightTexture0, xlv_TEXCOORD5).w * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x)
  )) * clamp (dot (tmpvar_1, tmpvar_3), 0.0, 1.0));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 37 math, 4 textures, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  tmpvar_3 = (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  float mydist_7;
  mydist_7 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_8;
  tmpvar_8 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  float tmpvar_9;
  if ((tmpvar_8.x < mydist_7)) {
    tmpvar_9 = _LightShadowData.x;
  } else {
    tmpvar_9 = 1.0;
  };
  vec3 viewDir_10;
  viewDir_10 = -(xlv_TEXCOORD1);
  vec2 tmpvar_11;
  tmpvar_11.x = dot ((viewDir_10 - (2.0 * 
    (dot (tmpvar_1, viewDir_10) * tmpvar_1)
  )), tmpvar_5);
  tmpvar_11.y = (1.0 - clamp (dot (tmpvar_1, viewDir_10), 0.0, 1.0));
  vec2 tmpvar_12;
  tmpvar_12.x = ((tmpvar_11 * tmpvar_11) * (tmpvar_11 * tmpvar_11)).x;
  tmpvar_12.y = (1.0 - _Glossiness);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (((tmpvar_3 + 
    ((texture2D (unity_NHxRoughness, tmpvar_12).w * 16.0) * tmpvar_4)
  ) * (_LightColor0.xyz * 
    (tmpvar_6.w * tmpvar_9)
  )) * clamp (dot (tmpvar_1, tmpvar_5), 0.0, 1.0));
  vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif
"
}
SubProgram "opengl " {
// Stats: 38 math, 5 textures, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * TANGENT.www);
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  tmpvar_3 = (tmpvar_2 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  vec4 tmpvar_7;
  tmpvar_7 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  float mydist_8;
  mydist_8 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_9;
  tmpvar_9 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  float tmpvar_10;
  if ((tmpvar_9.x < mydist_8)) {
    tmpvar_10 = _LightShadowData.x;
  } else {
    tmpvar_10 = 1.0;
  };
  vec3 viewDir_11;
  viewDir_11 = -(xlv_TEXCOORD1);
  vec2 tmpvar_12;
  tmpvar_12.x = dot ((viewDir_11 - (2.0 * 
    (dot (tmpvar_1, viewDir_11) * tmpvar_1)
  )), tmpvar_5);
  tmpvar_12.y = (1.0 - clamp (dot (tmpvar_1, viewDir_11), 0.0, 1.0));
  vec2 tmpvar_13;
  tmpvar_13.x = ((tmpvar_12 * tmpvar_12) * (tmpvar_12 * tmpvar_12)).x;
  tmpvar_13.y = (1.0 - _Glossiness);
  vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = (((tmpvar_3 + 
    ((texture2D (unity_NHxRoughness, tmpvar_13).w * 16.0) * tmpvar_4)
  ) * (_LightColor0.xyz * 
    ((tmpvar_6.w * tmpvar_7.w) * tmpvar_10)
  )) * clamp (dot (tmpvar_1, tmpvar_5), 0.0, 1.0));
  vec4 xlat_varoutput_15;
  xlat_varoutput_15.xyz = tmpvar_14.xyz;
  xlat_varoutput_15.w = 1.0;
  gl_FragData[0] = xlat_varoutput_15;
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLSL"
}
}
 }


 // Stats for Vertex shader:
 //      opengl : 2 avg math (1..3)
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 502614
Program "vp" {
SubProgram "opengl " {
// Stats: 1 math
Keywords { "SHADOWS_DEPTH" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_LightShadowBias;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform mat4 unity_MatrixVP;
void main ()
{
  vec3 vertex_1;
  vertex_1 = gl_Vertex.xyz;
  vec4 clipPos_2;
  if ((unity_LightShadowBias.z != 0.0)) {
    vec4 tmpvar_3;
    tmpvar_3.w = 1.0;
    tmpvar_3.xyz = vertex_1;
    vec3 tmpvar_4;
    tmpvar_4 = (_Object2World * tmpvar_3).xyz;
    vec4 v_5;
    v_5.x = _World2Object[0].x;
    v_5.y = _World2Object[1].x;
    v_5.z = _World2Object[2].x;
    v_5.w = _World2Object[3].x;
    vec4 v_6;
    v_6.x = _World2Object[0].y;
    v_6.y = _World2Object[1].y;
    v_6.z = _World2Object[2].y;
    v_6.w = _World2Object[3].y;
    vec4 v_7;
    v_7.x = _World2Object[0].z;
    v_7.y = _World2Object[1].z;
    v_7.z = _World2Object[2].z;
    v_7.w = _World2Object[3].z;
    vec3 tmpvar_8;
    tmpvar_8 = normalize(((
      (v_5.xyz * gl_Normal.x)
     + 
      (v_6.xyz * gl_Normal.y)
    ) + (v_7.xyz * gl_Normal.z)));
    float tmpvar_9;
    tmpvar_9 = dot (tmpvar_8, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_4 * _WorldSpaceLightPos0.w)
    )));
    vec4 tmpvar_10;
    tmpvar_10.w = 1.0;
    tmpvar_10.xyz = (tmpvar_4 - (tmpvar_8 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_9 * tmpvar_9)))
    )));
    clipPos_2 = (unity_MatrixVP * tmpvar_10);
  } else {
    vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = vertex_1;
    clipPos_2 = (gl_ModelViewProjectionMatrix * tmpvar_11);
  };
  vec4 clipPos_12;
  clipPos_12.xyw = clipPos_2.xyw;
  clipPos_12.z = (clipPos_2.z + clamp ((unity_LightShadowBias.x / clipPos_2.w), 0.0, 1.0));
  clipPos_12.z = mix (clipPos_12.z, max (clipPos_12.z, -(clipPos_2.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_12;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "opengl " {
// Stats: 3 math
Keywords { "SHADOWS_CUBE" }
"!!GLSL#version 120

#ifdef VERTEX
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  xlv_TEXCOORD0 = ((_Object2World * gl_Vertex).xyz - _LightPositionRange.xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  gl_FragData[0] = vec4((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) * _LightPositionRange.w));
}


#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
"!!GLSL"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
"!!GLSL"
}
}
 }
}
Fallback "VertexLit"
}