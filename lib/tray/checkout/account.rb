# encoding: UTF-8
module Tray
  module Checkout
    class Account < Tray::Checkout::BaseService
      def initialize(account=nil)
        @account = account || Tray::Checkout.token_account
      end

      def valid?
        get_info.success?
      end

      def get_info
        request("get_seller_or_company", { token_account: @account })
      end

      protected

      def api_url
        "#{Tray::Checkout.api_url}/api/people/"
      end
    end
  end
end
