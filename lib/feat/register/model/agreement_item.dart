class AgreementItemModel {
  const AgreementItemModel({
    required this.title,
    required this.isRequired,
  });

  final String title;
  final bool isRequired;
}

// ! Test Data
const agreementItemModelTestData = [
  AgreementItemModel(
    title: '만 14세 이상입니다.',
    isRequired: true,
  ),
  AgreementItemModel(
    title: '이용약관',
    isRequired: true,
  ),
  AgreementItemModel(
    title: '개인정보수집 및 이용동의',
    isRequired: true,
  ),
  AgreementItemModel(
    title: '개인정보 마케팅 활용 동의',
    isRequired: false,
  ),
  AgreementItemModel(
    title: '이벤트, 쿠폰, 특가 알림 등 마케팅 정보 수신 동의',
    isRequired: false,
  ),
];
