### WITH COFFEE SCRIPT ###
Chart.defaults.global.tooltips.enabled = true;
    #suppress = do ->
      #this.showTooltip(this.segments, true)
      tooltipTemplate: "<%if (label){%><%=label%><%}%>",
      onAnimationComplete: suppress,
      tooltipEvents: [],
      showTooltips: true,

      onAnimationComplete: (->
        if @options.showInlineValues
          if @name == 'Bar'
            @eachBars (bar) ->
              tooltipPosition = bar.tooltipPosition()
              new (Chart.Tooltip)(
                x: Math.round(tooltipPosition.x)
                y: if @options.centeredInllineValues then Math.round(bar.y + bar.height() / 2 + (@options.tooltipFontSize + @options.tooltipYPadding) / 2) else Math.round(tooltipPosition.y)
                xPadding: @options.tooltipXPadding
                yPadding: @options.tooltipYPadding
                fillColor: @options.tooltipFillColor
                textColor: @options.tooltipFontColor
                fontFamily: @options.tooltipFontFamily
                fontStyle: @options.tooltipFontStyle
                fontSize: @options.tooltipFontSize
                caretHeight: @options.tooltipCaretSize
                cornerRadius: @options.tooltipCornerRadius
                text: bar.value
                chart: @chart).draw()
              return
      ),

      tooltipEvents: [],
      onAnimationComplete: (->
        @eachBars (bar) ->
          tooltipPosition = bar.tooltipPosition()
          new (Chart.Tooltip)(
            x: Math.round(tooltipPosition.x)
            y: Math.round(tooltipPosition.y)
            xPadding: @options.tooltipXPadding
            yPadding: @options.tooltipYPadding
            fillColor: @options.tooltipFillColor
            textColor: @options.tooltipFontColor
            fontFamily: @options.tooltipFontFamily
            fontStyle: @options.tooltipFontStyle
            fontSize: @options.tooltipFontSize
            caretHeight: @options.tooltipCaretSize
            cornerRadius: @options.tooltipCornerRadius
            text: bar.value
            chart: @chart).draw()
          return
        return
      ),


