require 'spec_helper'
require 'pry-nav'

module Pronto
  describe JSCSRunner do
    let(:jscs) { JSCS::Wrapper.new(patches.first) }

    describe '#run' do
      subject { jscs.lint }

      context 'patches with a one warning' do
        include_context 'test repo'

        let(:patches) { repo.diff('master') }

        its(:count) { should == 1 }

        let(:violations) { subject[patches.first.new_file_full_path.to_s] }

        specify do
          binding.pry
          expect(violations.first['message']).to eq(
            'Expected indentation of 2 characters')
          expect(violations.count).to be(2)
        end
      end
    end
  end
end
