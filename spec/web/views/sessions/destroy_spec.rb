RSpec.describe Web::Views::Sessions::Destroy, type: :view do
  let(:exposures) { Hash[format: :html] }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  xit 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end
end
