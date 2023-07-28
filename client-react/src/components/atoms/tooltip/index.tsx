import React, {useRef} from "react";
import styles from './styles.module.scss'

export const TooltipTheme = {
    DEFAULT: 'default',
    ROUNDED: 'rounded',
}
export const TooltipSize = {
    SMALL: 'small',
    MEDIUM: 'medium',
    LARGE: 'large',
}

export const TooltipWrapper = (props: any): React.ReactElement => {
    const {
        children,
        style,
    } = props

    const tooltipWrapperRef = useRef<HTMLDivElement>(null)
    const tooltipRef = useRef<HTMLDivElement>(null)

    return (
        <>
            <div ref={tooltipWrapperRef} className="tooltip-wrapper" style={styles.tooltip_wrapper}>
                <div ref={tooltipRef} className="tooltip" style={styles.tooltip} />
            </div>
            { children }
        </>
    )
}