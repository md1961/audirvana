require 'nkf'

module StringExtension
  refine String do

    def to_hiragana
      NKF.nkf('--hiragana -w', self)
    end
  end
end
