=begin
Copyright 2017 mitz hayasaka.mitsuru@gmail.com

See the file LICENSE for copying permission.
=end

require 'pre-commit/error_list'
require 'pre-commit/checks/plugin'

# :nodoc:
module PreCommit
  # :nodoc:
  module Checks

    #
    # slimlint
    #
    class Slimlint < Plugin

      #
      # description of the plugin
      #
      def self.description
        "slimlint"
      end

      #
      # Finds files and verify them
      #
      # @param staged_files [Array<String>] list of files to check
      #
      # @return [nil|Array<PreCommit::ErrorList>] nil when no errors,
      #                                           list of errors otherwise
      def call(staged_files)
        errors = run_check(staged_files).compact
        return if errors.empty?

        errors
      end

    private

      #
      # slimlint
      #
      # @param file [String] path to file to verify
      #
      # @return [nil|PreCommit::ErrorList] nil when file verified,
      #                                    ErrorList when verification failed
      #
      def run_check(files)
        args = %w{slim-lint} + files
        execute(args)
      end
    end
  end
end
