module RedmineMailingListIntegration
  module Drivers
    class FmlDriver
      include TypicalDriver

      def likelihood
        if /\Afml / =~ @email.header_string("List-Software") and
          @email.header_string("X-ML-Name") == @mailing_list.identifier then
          EXACTLY_MATCHED
        else
          NOT_MATCHED
        end
      end
    end
  end
end
