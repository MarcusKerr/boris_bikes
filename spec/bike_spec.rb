require 'Bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  describe '#report_broken' do
    it 'sets bikes status to broke' do
      subject.report_broken
      expect(subject.broken?).to be broken
    end
  end

end