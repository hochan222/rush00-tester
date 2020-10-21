/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   rush00.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: holee <holee@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/20 18:59:07 by holee             #+#    #+#             */
/*   Updated: 2020/10/21 22:44:38 by holee            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "rush.h"

void	ft_putchar(char c);

void	rush(int x, int y)
{
	int w;
	int h;

	h = 0;
	while (h < y)
	{
		w = 0;
		while (w < x)
		{
			if ((w == 0 && h == 0) || (w == 0 && h == y - 1) ||
			(w == x - 1 && h == 0) || (w == x - 1 && h == y - 1))
				ft_putchar('o');
			else if (w == 0 || w == x - 1)
				ft_putchar('|');
			else if (h == 0 || h == x - 1)
				ft_putchar('-');
			else
				ft_putchar(' ');
			w++;
		}
		ft_putchar('\n');
		h++;
	}
}
