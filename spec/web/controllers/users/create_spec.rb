RSpec.describe Web::Controllers::Users::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  xit 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
