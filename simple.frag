#version 150 core

// ���X�^���C�U����󂯎�钸�_�����̕�Ԓl
in vec4 dc;                                         // ���_�F�̊g�U���ˌ������{��������
in vec4 sc;                                         // ���_�F�̋��ʔ��ˌ�����

// �t���[���o�b�t�@�ɏo�͂���f�[�^
out vec4 fc;                                        // �t���O�����g�̐F

void main(void)
{
  fc = dc + sc;
}
