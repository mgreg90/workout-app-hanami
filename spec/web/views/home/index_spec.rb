RSpec.describe Web::Views::Home::Index, type: :view do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  xit 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end
end
