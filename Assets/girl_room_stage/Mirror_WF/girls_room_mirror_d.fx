////////////////////////////////////////////////////////////////////////////////////////////////
//
//  MirrorWF.fx ver0.0.5  �C�ӕ��ʂւ̋����`��
//  �쐬: �j��P( ���͉��P����Mirror.fx, full.fx,���� )
//
////////////////////////////////////////////////////////////////////////////////////////////////
// �A�N�Z�ɑg�ݍ��ޏꍇ�͂�����K�X�ύX���Ă��������D
float3 MirrorColor = float3(1.0, 1.0, 1.0); // ���ʂ̏�Z�F(RGB)
float3 MirrorAlpha = 1.0; // ���ʂ̏������ߒl

#define FLG_EXCEPTION  0  // MMD�Ń��f������������ɕ`�悳��Ȃ��ꍇ�͂�����1�ɂ���

// ����Ȃ��l�͂������牺�͂�����Ȃ��ł�

///////////////////////////////////////////////////////////////////////////////////////////////

// ���W�ϊ��s��
float4x4 WorldMatrix     : WORLD;
float4x4 ViewMatrix      : VIEW;
float4x4 ProjMatrix      : PROJECTION;
float4x4 ViewProjMatrix  : VIEWPROJECTION;

//�J�����ʒu
float3 CameraPosition : POSITION  < string Object = "Camera"; >;

// ���ߒl
float AcsTr  : CONTROLOBJECT < string name = "(self)"; string item = "Tr"; >;

// �X�N���[���T�C�Y
float2 ViewportSize : VIEWPORTPIXELSIZE;
static float2 ViewportOffset = (float2(0.5f, 0.5f)/ViewportSize);

//MMM�Ή�
#ifndef MIKUMIKUMOVING
    #if(FLG_EXCEPTION == 0)
        #define OFFSCREEN_FX_OBJECT  "girls_room_mirror_d.fxsub"      // �I�t�X�N���[�������`��G�t�F�N�g
    #else
        #define OFFSCREEN_FX_OBJECT  "MWF_ObjectExc.fxsub"   // �I�t�X�N���[�������`��G�t�F�N�g
    #endif
    #define GET_VPMAT(p) (ViewProjMatrix)
#else
    #define OFFSCREEN_FX_OBJECT  "MWF_Object_MMM.fxsub" // �I�t�X�N���[�����f���`��G�t�F�N�g
    #define GET_VPMAT(p) (MMM_IsDinamicProjection ? mul(ViewMatrix, MMM_DynamicFov(ProjMatrix, length(CameraPosition-p.xyz))) : ViewProjMatrix)
#endif

// �����`��̃I�t�X�N���[���o�b�t�@
texture MirrorWFRT : OFFSCREENRENDERTARGET <
    string Description = "OffScreen RenderTarget for MirrorWF.fx";
    float2 ViewPortRatio = {1.0,1.0};
    float4 ClearColor = { 1, 1, 1, 1 };
    float ClearDepth = 1.0;
    bool AntiAlias = true;
    string DefaultEffect = 
        "self = hide;"
        "* = " OFFSCREEN_FX_OBJECT ";" ;
>;
sampler MirrorWFView = sampler_state {
    texture = <MirrorWFRT>;
    MinFilter = LINEAR;
    MagFilter = LINEAR;
    MipFilter = NONE;
    AddressU  = CLAMP;
    AddressV = CLAMP;
};


////////////////////////////////////////////////////////////////////////////////////////////////
// �����`��

struct VS_OUTPUT {
    float4 Pos  : POSITION;
    float4 VPos : TEXCOORD1;
};

VS_OUTPUT VS_Mirror(float4 Pos : POSITION)
{
    VS_OUTPUT Out = (VS_OUTPUT)0;

    // ���[���h���W�ϊ�
    Pos = mul( Pos, WorldMatrix );

    // �J�������_�̃r���[�ˉe�ϊ�
    Out.Pos = mul( Pos, GET_VPMAT(Pos) );
    Out.VPos = Out.Pos;

    return Out;
}

float4 PS_Mirror(VS_OUTPUT IN) : COLOR
{
    // �����̃X�N���[���̍��W(���E���]���Ă���̂Ō��ɖ߂�)
    float2 texCoord = float2( 1.0f - ( IN.VPos.x/IN.VPos.w + 1.0f ) * 0.5f,
                              1.0f - ( IN.VPos.y/IN.VPos.w + 1.0f ) * 0.5f ) + ViewportOffset;

    // �����̐F
    float4 Color = tex2D(MirrorWFView, texCoord);
    Color.xyz *= MirrorColor;
    Color.a *= AcsTr * MirrorAlpha;

    return Color;
}

////////////////////////////////////////////////////////////////////////////////////////////////
//�e�N�j�b�N

technique MainTec{
    pass DrawObject{
        CullMode = NONE;
        VertexShader = compile vs_2_0 VS_Mirror();
        PixelShader  = compile ps_2_0 PS_Mirror();
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////



