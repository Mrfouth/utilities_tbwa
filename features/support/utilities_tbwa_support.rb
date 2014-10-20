module UtilitiesTbwaSupport
  def install_utilities_tbwa(path = nil)
    if path
      run_simple("bundle exec utilities_tbwa install --path '#{path}'")
    else
      run_simple("bundle exec utilities_tbwa install")
    end
  end

  def utilities_tbwa_path(prefix, path)
    if prefix
      File.join(prefix, 'utilities_tbwa', path)
    else
      File.join('utilities_tbwa', path)
    end
  end
end

World(UtilitiesTbwaSupport)
