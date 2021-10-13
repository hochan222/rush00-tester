/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   rush04.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sejang <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/26 13:54:09 by sejang            #+#    #+#             */
/*   Updated: 2020/01/26 13:54:11 by sejang           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "rush.h"

void	rust(int x, int y);
int		hash(int x, int n);

void	rush(int x, int y)
{
	static char const *const	boundaries = "ABCB BCBA";
	int							i;
	int							j;

	j = 0;
	while (j < y)
	{
		i = 0;
		while (i < x)
		{
			ft_putchar(boundaries[3 * hash(j, y) + hash(i, x)]);
			++i;
		}
		ft_putchar('\n');
		++j;
	}
}

int		hash(int x, int n)
{
	return (x ? 1 + (x + 1) / n : x);
}
