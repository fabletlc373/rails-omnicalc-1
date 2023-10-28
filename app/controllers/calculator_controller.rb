class CalculatorController < ApplicationController
  def go_home
    render({:template => "calculator_templates/home"})
  end

  def new_op
    @op = params.fetch('operation')
    if @op == 'square'
      render({:template => "calculator_templates/home"})
    elsif @op == 'square_root'
      render({:template => "calculator_templates/srhome"})
    elsif @op == 'payment'
      render({:template => "calculator_templates/paymenthome"})
    else
      render({:template => "calculator_templates/randomhome"})
    end
  end


  def op_results
    @op = params.fetch('operation')
    if @op == 'square'
      @num = params.fetch('number').to_f
      @num_sq = @num**2
      render({:template => "calculator_templates/sresults"})
    elsif @op == 'square_root'
      @num = params.fetch('user_number').to_f
      @num_sqr = @num ** 0.5
      render({:template => "calculator_templates/srresults"})
    elsif @op == 'payment'
      @apr = params.fetch('user_apr').to_f / 100
      @y = params.fetch('user_years').to_f
      @p = params.fetch('user_pv').to_f
      r = @apr / 12
      n = @y * 12
      @Payment = (r * @p) / (1-(1+r)**(-1 * n))
      render({:template => "calculator_templates/paymentresults"})
    else
      @min = params.fetch('user_min').to_f
      @max = params.fetch('user_max').to_f
      @r = rand(@min..@max)
      render({:template => "calculator_templates/randomresults"})
    end
  end






end
