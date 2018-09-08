require 'Bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  describe '#report_broken' do
    it 'sets bikes status to broken' do
      subject.report_broken
      expect(subject.broken?).to be(true)
    end
  end
end
