#version 150 core

// ����
const vec4 pl     = vec4(3.0, 4.0, 5.0, 1.0);       // �ʒu
const vec4 lamb   = vec4(0.2, 0.2, 0.2, 1.0);       // ���������̋��x
const vec4 ldiff  = vec4(1.0, 1.0, 1.0, 0.0);       // �g�U���ː����̋��x
const vec4 lspec  = vec4(1.0, 1.0, 1.0, 0.0);       // ���ʔ��ː����̋��x

// �ގ�
const vec4 kamb   = vec4(0.6, 0.6, 0.6, 1.0);       // �����̔��ˌW��
const vec4 kdiff  = vec4(0.6, 0.6, 0.6, 1.0);       // �g�U���ˌW��
const vec4 kspec  = vec4(0.4, 0.4, 0.4, 1.0);       // ���ʔ��ˌW��
const float kshi  = 40.0;                           // �P���W��

// ���_����
in vec4 pv;                                         // ���[�J�����W�n�̒��_�ʒu
in vec4 nv;                                         // ���_�̖@���x�N�g��

// �ϊ��s��
uniform mat4 mw;                                    // ���_���W�n�ւ̕ϊ��s��
uniform mat4 mc;                                    // �N���b�s���O���W�n�ւ̕ϊ��s��
uniform mat4 mg;                                    // �@���x�N�g���̕ϊ��s��

// ���X�^���C�U�ɑ��钸�_����
out vec4 dc;                                        // ���_�F�̊g�U���ˌ������{��������
out vec4 sc;                                        // ���_�F�̋��ʔ��ˌ�����

void main(void)
{
  vec4 p = mw * pv;                                 // ���_���W�n�̒��_�̈ʒu
  vec3 v = -normalize(p.xyz / p.w);                 // �����x�N�g��
  vec3 l = normalize((pl * p.w - p * pl.w).xyz);    // �����x�N�g��
  vec3 n = normalize((mg * nv).xyz);                // �@���x�N�g��
  vec3 h = normalize(l + v);                        // ���ԃx�N�g��

  vec4 iamb = kamb * lamb;
  vec4 idiff = max(dot(n, l), 0.0) * kdiff * ldiff;
  vec4 ispec = pow(max(dot(n, h), 0.0), kshi) * kspec * lspec;

  dc = iamb + idiff;
  sc = ispec;

  gl_Position = mc * pv;
}
